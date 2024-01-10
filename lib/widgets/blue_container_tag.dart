import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

class BlueTag extends StatelessWidget {
  final String title;

  const BlueTag({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      height: 35,
      width: 220,
      decoration: BoxDecoration(
        color: kPrimaryColorHeavy,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}