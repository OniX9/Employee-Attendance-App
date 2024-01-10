import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

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