import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      appBar: MyAppBar(context, label: 'Subscriptions'),
      body: Column(
        children: [
          CustomCard(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.all(15),
            height: 300,
            width: double.maxFinite,
            borderRadius: BorderRadius.circular(25),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('FREE', style: TextStyle(
                  fontSize: 20,
                  fontWeight:FontWeight.w800,
                ),
                ),
                Text('Basic Attendance functionality',
                  style: kCardDescriptionTextStyle,
                ),
                RichText(text: TextSpan(
                  text: r'$4',
                  style: kHeadingTextstyle.copyWith(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  )
                ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
