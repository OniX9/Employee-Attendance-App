import 'dart:async';

import 'package:employee_attendance/controller/dataProviders/calender_events.dart';
import 'package:employee_attendance/controller/dataProviders/public_holidays.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/controller/uiProviders/attendance_report_ui.dart';
import 'package:employee_attendance/controller/uiProviders/mark_attendance_ui.dart';
import 'package:employee_attendance/controller/uiProviders/public_holidays_ui.dart';
import 'package:employee_attendance/controller/uiProviders/salary_calculator_ui.dart';
import 'package:employee_attendance/screens/admin_salary_calculator_b_screen.dart';
import 'package:employee_attendance/screens/onboarding_screen.dart';
import 'package:employee_attendance/test.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_attendance/screens/login_signup_screen.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void main() {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    initializeMapRenderer();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdminUIProvider()),
        ChangeNotifierProvider(create: (context) => PublicHolidaysUIProvider()),
        ChangeNotifierProvider(create: (context) => SalaryCalculatorUIProvider(),),
        ChangeNotifierProvider(create: (context) => AttendanceReportUIProvider(),),
        ChangeNotifierProvider(create: (context) => PublicHolidaysProvider()),
        ChangeNotifierProvider(create: (context) => CalenderEventsProvider()),
        ChangeNotifierProvider(create: (context) => MarkAttendanceUIProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        // home: const OnBoardingScreen(),
        home: LoginSignUpScreen(),
        // home: AdminSalaryCalculatorBScreen('Ola James'),
      ),
    );
  }
}

Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

/// Initializes map renderer to the `latest` renderer type for Android platform.
///
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.
Future<AndroidMapRenderer?> initializeMapRenderer() async {
  if (_initializedRendererCompleter != null) {
    return _initializedRendererCompleter!.future;
  }

  final Completer<AndroidMapRenderer?> completer =
  Completer<AndroidMapRenderer?>();
  _initializedRendererCompleter = completer;

  WidgetsFlutterBinding.ensureInitialized();

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    unawaited(mapsImplementation
        .initializeWithRenderer(AndroidMapRenderer.latest)
        .then((AndroidMapRenderer initializedRenderer) =>
        completer.complete(initializedRenderer)));
  } else {
    completer.complete(null);
  }

  return completer.future;
}