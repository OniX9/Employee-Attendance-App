import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/settings_screen.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
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
      backgroundColor: const Color(0xFFE5F2F3),
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
                              direction: Slide.right,
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
class MenuButton extends StatelessWidget {
  final void Function()? onPressed;

  const MenuButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: 1.2,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.more_vert_rounded, size: 35),
      ),
    );
  }
}

// 2.
class DashboardProfile extends StatelessWidget {
  const DashboardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 45, bottom: 80),
      width: double.maxFinite,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile_pic.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Good Morning,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'OLA JAMES',
                style: kHeading1Textstyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// 3.
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
                ),
                DashBoardListItem(
                  title: 'ADD EMPLOYEE',
                  description: 'List of registered employees',
                  imageUrl: "assets/images/employee_dashboard/profile.png",
                ),
                DashBoardListItem(
                  title: 'VIEW EMPLOYEES',
                  description: 'Mark your daily attendance',
                  imageUrl:
                      "assets/images/admin_dashboard_only/view_employees.png",
                ),
                DashBoardListItem(
                  title: 'TODAY PRESENT EMPLOYEES',
                  description:
                      'Check dates with all registered employees present or punch in/out',
                  imageUrl:
                      "assets/images/admin_dashboard_only/today_present_employees.png",
                ),
                DashBoardListItem(
                  title: 'SALARY CALCULATOR',
                  description:
                      'Check month wise attendance & calculate salary for particular employee',
                  imageUrl:
                      "assets/images/admin_dashboard_only/salary_calculator.png",
                ),
                DashBoardListItem(
                  title: 'VIEW ATTENDANCE REPORT',
                  description:
                      'Check your month wie attendance reports in Chart format',
                  imageUrl: "assets/images/employee_dashboard/report.png",
                ),
                DashBoardListItem(
                  title: 'LIVE TRACKING',
                  description: 'Track only current location of employee',
                  imageUrl:
                      "assets/images/admin_dashboard_only/live_tracking.png",
                ),
                DashBoardListItem(
                  title: 'CHANGE PASSWORD',
                  description: 'Allow to change your password',
                  imageUrl:
                      "assets/images/employee_dashboard/change_password.png",
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
                        imageUri: 'assets/images/admin_dashboard_only/broadcast_notification.png',
                        bottomRegionColor: kPrimaryColorHeavy,
                        title: 'BROADCAST NOTIFICATION',
                        description: 'Send common message to all your registered employees.',
                      ),
                      DashBoardExtraCard(
                        imageUri: 'assets/images/admin_dashboard_only/notes_rules.png',
                        bottomRegionColor: kPrimaryColorLight,
                          title: 'NOTES/RULES',
                          description: 'Important notes/rules which your registered employees need to take note.',
                      ),
                      SizedBox(width:20),
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

class DashBoardExtraCard extends StatelessWidget {
  final Color? bottomRegionColor;
  final String imageUri;
  final String title;
  final String description;

  const DashBoardExtraCard({
    this.bottomRegionColor,
    required this.imageUri,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Column(
                    children: [
                      Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
    );
  }
}

class DashBoardListItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const DashBoardListItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.only(top: 12, right: 20, left: 20),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.black12,
                width: 1.2,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 45,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 200,
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
            color: Colors.grey[700],
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

// 4.
class DayAndDateText extends StatelessWidget {
  const DayAndDateText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: 1.1,
      scaleX: 0.98,
      child: Text(
        'Wed, 20 Dec 2023',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
