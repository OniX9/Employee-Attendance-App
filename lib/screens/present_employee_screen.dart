import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/clickable_text.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class PresentEmployeeScreen extends StatelessWidget {
  const PresentEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      appBar: MyAppBar(
        context,
        label: 'Employees',
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 32),
        ),
      ),
      body: Column(
        children: [
          CalenderContainer(),
          AttendanceStatusContainer(),
          Expanded(
            child: SizedBox(
              child: ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  EmployeeItem(online: true, name: 'OLA JAMES', designation: 'Employee',),
                  EmployeeItem(online: false, name: 'BRIGHT', designation: 'Cybersecurity lead',),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//**Main WIDGETS**
// 1. A status bar at the top showing no. of checked in, absent, and total employees.
class AttendanceStatusContainer extends StatelessWidget {
  const AttendanceStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AttendanceStatItem(label: '1 EMPLOYEES'),
          SizedBox(width: 16),
          AttendanceStatItem(label: '0 CHECKED IN'),
          SizedBox(width: 16),
          AttendanceStatItem(label: '1 NOT ATTEND'),
        ],
      ),
    );
  }
}

class AttendanceStatItem extends StatelessWidget {
  final String label;

  const AttendanceStatItem({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 35,
        borderRadius: BorderRadius.circular(5),
        child: Text(
          label,
          style: kCardDescriptionTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// 2. Calender Container
// Top Calender text and icon matching with the appbar
class CalenderContainer extends StatelessWidget {
  const CalenderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: 56,
      color: kPrimaryColorHeavy,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '17 Jan 2024',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 17, color: Colors.white),
          ),
          SizedBox(width: 10),
          Icon(Icons.calendar_today_rounded, size: 20),
        ],
      ),
    );
  }
}

// 3. Employee Attendance Item
// Added to a list with details of the employee & the punch in / out time.
class EmployeeItem extends StatelessWidget {
  final bool online;
  final String name;
  final String designation;

  const EmployeeItem({
    required this.online,
    required this.name,
    required this.designation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
      height: 130,
      child: Column(
        children: [
          Row(
            children: [
              OnlineStatusIndicator(online: online),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: kCardTitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    designation,
                    style: kCardDescriptionTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Expanded(flex: 3, child: SizedBox()),
              InOutTimeWidget(label: 'IN'),
              Expanded(flex: 1, child: SizedBox()),
              InOutTimeWidget(label: 'Out'),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: ClickableText(
                'MAKE CALL',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnlineStatusIndicator extends StatelessWidget {
  final bool online;

  const OnlineStatusIndicator({
    required this.online,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ProfilePicture(radius: 30),
        Container(
          height: 15,
          width: 15,
          margin: EdgeInsets.only(bottom: 3, right: 3),
          decoration: BoxDecoration(
            color: online ? Colors.green[400] : Colors.grey[300],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
        ),
      ],
    );
  }
}

class InOutTimeWidget extends StatelessWidget {
  final String label;

  const InOutTimeWidget({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kCardTitleTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'N/A',
          style: kCardTitleTextStyle.copyWith(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
