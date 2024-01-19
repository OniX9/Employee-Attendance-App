import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/add_employee_screen.dart';
import 'package:employee_attendance/screens/admin_attendance_report_a_screen.dart';
import 'package:employee_attendance/screens/admin_salary_calculator_a_screen.dart';
import 'package:employee_attendance/screens/notes_rules_screen.dart';
import 'package:employee_attendance/screens/present_employee_screen.dart';
import 'package:employee_attendance/screens/public_holidays_screen.dart';
import 'package:employee_attendance/screens/settings_screen.dart';
import 'package:employee_attendance/screens/live_tracking_screen.dart';
import 'package:employee_attendance/screens/view_employee_screen.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/dashboard_profile.dart';
import 'package:employee_attendance/widgets/day_and_date_text.dart';
import 'package:employee_attendance/widgets/menu_button.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:employee_attendance/widgets/dashboard_list_item.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../controller/uiProviders/admin_ui.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<AdminUIProvider>(context);

    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.375,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/login/background.png'),
                  fit: BoxFit.fill,
                )),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: MenuButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageTransition(
                                direction: SlideFrom.right,
                                SettingScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: DashboardProfile(),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: DashBoardListView(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// **CUSTOM WIDGETS**
// 1.
class DashBoardListView extends StatelessWidget {
  const DashBoardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.72,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: DayAndDateText(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                DashBoardListItem(
                  title: 'ADD HOLIDAYS',
                  description: 'Add public holidays only',
                  imageUrl: "assets/images/employee_dashboard/holidays.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        PublicHolidaysScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'ADD EMPLOYEE',
                  description: 'List of registered employees',
                  imageUrl: "assets/images/employee_dashboard/profile.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        AddEmployeeScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'VIEW EMPLOYEES',
                  description: 'Mark your daily attendance',
                  imageUrl:
                      "assets/images/admin_dashboard_only/view_employees.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        ViewEmployeeScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'TODAY PRESENT EMPLOYEES',
                  description:
                      'Check dates with all registered employees present or punch in/out',
                  imageUrl:
                      "assets/images/admin_dashboard_only/today_present_employees.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        PresentEmployeeScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'SALARY CALCULATOR',
                  description:
                      'Check month wise attendance & calculate salary for particular employee',
                  imageUrl:
                      "assets/images/admin_dashboard_only/salary_calculator.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        AdminSalaryCalculatorAScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'VIEW ATTENDANCE REPORT',
                  description:
                      'Check your month wie attendance reports in Chart format',
                  imageUrl: "assets/images/employee_dashboard/report.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        AdminAttendanceReportAScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'LIVE TRACKING',
                  description: 'Track only current location of employee',
                  imageUrl:
                      "assets/images/admin_dashboard_only/live_tracking.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        LiveTrackingScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'CHANGE PASSWORD',
                  description: 'Allow to change your password',
                  imageUrl:
                      "assets/images/employee_dashboard/change_password.png",
                  onPressed: () {},
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'EXTRA',
                    style: kSettingsTextStyle.copyWith(fontSize: 12),
                  ),
                ),
                Container(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      DashBoardExtraCard(
                        imageUri:
                            'assets/images/admin_dashboard_only/broadcast_notification.png',
                        bottomRegionColor: kPrimaryColorHeavy,
                        title: 'BROADCAST NOTIFICATION',
                        description:
                            'Send common message to all your registered employees.',
                        onPressed: () {},
                      ),
                      DashBoardExtraCard(
                        imageUri:
                            'assets/images/admin_dashboard_only/notes_rules.png',
                        bottomRegionColor: kPrimaryColorLight,
                        title: 'NOTES/RULES',
                        description:
                            'Important notes/rules which your registered employees need to take note.',
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                              NotesRulesScreen(),
                              direction: SlideFrom.right,
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 2.
class DashBoardExtraCard extends StatelessWidget {
  final void Function()? onPressed;

  final Color? bottomRegionColor;
  final String imageUri;
  final String title;
  final String description;

  const DashBoardExtraCard({
    this.bottomRegionColor,
    required this.imageUri,
    required this.title,
    required this.description,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomCard(
        margin: EdgeInsets.only(left: 10),
        width: 220,
        height: 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Image.asset(imageUri),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: bottomRegionColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: kCardDescriptionTextStyle.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
