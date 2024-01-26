import 'dart:ui';
import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/admin_add_employee_screen.dart';
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
import 'package:employee_attendance/widgets/password_change_popup.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
          BroadcastBackdropPopUp(
              popUp: uiConsumer.isBroadCastPopUpVisible,
              titleOnChanged: (newTitle){},
              descriptionOnChanged: (String newMessage){

              },
              saveActionButton: (){
                uiConsumer.toggleBroadCastPopUp();
              },
              cancelActionButton: (){
                uiConsumer.toggleBroadCastPopUp();
              },
          ),
          PasswordChangePopUp(
            popUp: uiConsumer.isAChangePasswordPopUpVisible,
            passwordOnChanged: (newPassword){
            },
            saveActionButton: (){
              uiConsumer.toggleAChangePasswordPopUp();
            },
            cancelActionButton: (){
              uiConsumer.toggleAChangePasswordPopUp();
            },
          ),
        ],
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
    var uiConsumer = Provider.of<AdminUIProvider>(context);
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
                        AdminAddEmployeeScreen(),
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
                  onPressed: () {
                    uiConsumer.toggleAChangePasswordPopUp();
                  },
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
                        onPressed: () {
                          uiConsumer.toggleBroadCastPopUp();
                        },
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

// 3.
class BroadcastBackdropPopUp extends StatelessWidget {
  final bool popUp;
  final void Function(String)? titleOnChanged;
  final void Function(String)? descriptionOnChanged;
  final void Function()? saveActionButton;
  final void Function()? cancelActionButton;

  const BroadcastBackdropPopUp({
    super.key,
    required this.popUp,
    required this.titleOnChanged,
    required this.descriptionOnChanged,
    required this.saveActionButton,
    required this.cancelActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      alignment: Alignment.bottomRight,
      scale: popUp ? 1 : 0.2,
      duration: Duration(milliseconds: 260),
      child: Visibility(
        visible: popUp,
        child: GestureDetector(
          onTap: cancelActionButton,
          child: Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 15),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Ensures the pop up's container isn't sensitive to touch,
                    // it returns nothing.
                  },
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 380, minHeight: 230),
                    padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Broadcast Notification',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration:  kPopUpInputDecoration.copyWith(
                              hintText: 'Enter Title',
                            ),
                            onChanged: titleOnChanged,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          maxLines: 3,
                          decoration: kPopUpInputDecoration.copyWith(
                            hintText: 'Enter Description',
                          ),
                          onChanged: descriptionOnChanged,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'CANCEL',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'SEND',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
