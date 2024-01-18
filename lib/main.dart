import 'package:employee_attendance/controller/dataProviders/calender_events.dart';
import 'package:employee_attendance/controller/dataProviders/public_holidays.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/controller/uiProviders/public_holidays_ui.dart';
import 'package:employee_attendance/screens/admin_salary_calculator_b_screen.dart';
import 'package:employee_attendance/screens/onboarding_screen.dart';
import 'package:employee_attendance/test.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_attendance/screens/login_signup_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdminUIProvider()),
        ChangeNotifierProvider(create: (context) => PublicHolidaysUIProvider()),
        ChangeNotifierProvider(create: (context) => PublicHolidaysProvider()),
        ChangeNotifierProvider(create: (context) => CalenderEventsProvider()),
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
        // home: LoginSignUpScreen(),
        home: AdminSalaryCalculatorBScreen('Ola James'),
      ),
    );
  }
}
