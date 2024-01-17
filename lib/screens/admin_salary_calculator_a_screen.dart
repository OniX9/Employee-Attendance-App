import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/admin_salary_calculator_b_screen.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:employee_attendance/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

import 'admin_attendance_report_b_screen.dart';

class AdminSalaryCalculatorAScreen extends StatelessWidget {
  const AdminSalaryCalculatorAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context,
        label: 'Employees',
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 32),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          SelectEmployeeContainer(
            name: 'OLA JAMES',
            mobileNo: 2341234567890,
            designation: 'EMPLOYEE',
          ),
          SelectEmployeeContainer(
            name: 'BRIGHT',
            mobileNo: 2342382839302,
            designation: 'CYBERSECURITY LEAD',
          ),
        ],
      ),
    );
  }
}

class SelectEmployeeContainer extends StatelessWidget {
  final String name;
  final int mobileNo;
  final String designation;

  const SelectEmployeeContainer({
    required this.name,
    required this.mobileNo,
    required this.designation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            AdminSalaryCalculatorBScreen(name),
            direction: SlideFrom.right,
          ),
        );
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        decoration: kDividerBoxDecoration,
        child: Row(
          children: [
            ProfilePicture(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kCardTitleTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.blueAccent[700],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '+$mobileNo',
                  style: kCardTitleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              width: 120,
              child: Text(
                designation,
                textAlign: TextAlign.right,
                style: kCardDescriptionTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.arrow_forward_ios,
                  color: Colors.black87, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
