import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/admin_attendance_report_b_screen.dart';
import 'package:employee_attendance/screens/admin_salary_calculator_b_screen.dart';
import 'package:employee_attendance/screens/employee_profile_screen.dart';
import 'package:employee_attendance/screens/mark_attendance_screen.dart';
import 'package:employee_attendance/screens/public_holidays_screen.dart';
import 'package:employee_attendance/screens/settings_screen.dart';
import 'package:employee_attendance/widgets/dashboard_list_item.dart';
import 'package:employee_attendance/widgets/dashboard_profile.dart';
import 'package:employee_attendance/widgets/day_and_date_text.dart';
import 'package:employee_attendance/widgets/menu_button.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../controller/uiProviders/admin_ui.dart';

class EmployeeDashboardScreen extends StatelessWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<AdminUIProvider>(context);

    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      body: Container(
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
                  title: 'PUBLIC HOLIDAYS',
                  description: 'Check allocated public holidays',
                  imageUrl: "assets/images/employee_dashboard/holidays.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      //TODO: Make adding public holidays admin only
                      PageTransition(
                        PublicHolidaysScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'PROFILE',
                  description: 'display your profile details',
                  imageUrl: "assets/images/employee_dashboard/profile.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      //TODO: Make adding public holidays admin only
                      PageTransition(
                        EmployeeProfileScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'MARK ATTENDANCE',
                  description: 'Mark your daily attendance',
                  imageUrl:
                      "assets/images/employee_dashboard/mark_attendance.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      //TODO: Make adding public holidays admin only
                      PageTransition(
                        MarkAttendanceScreen(),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'VIEW ATTENDANCE',
                  description: 'Check your monthly attendance in detailing',
                  imageUrl:
                      "assets/images/employee_dashboard/view_attendance.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        AdminSalaryCalculatorBScreen('Ola James'),
                        direction: SlideFrom.right,
                      ),
                    );
                  },
                ),
                DashBoardListItem(
                  title: 'REPORT',
                  description:
                      'Check your month wie attendance reports in Chart format',
                  imageUrl: "assets/images/employee_dashboard/report.png",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        AdminAttendanceReportBScreen('Ola James'),
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
                DashBoardListItem(
                  title: 'NOTES/RULES',
                  description:
                      'Important notes/rules which you need to take note.',
                  imageUrl: "assets/images/employee_dashboard/notes.png",
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
