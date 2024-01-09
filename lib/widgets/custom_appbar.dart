import 'package:flutter/material.dart';
import 'package:employee_attendance/constants.dart';

PreferredSizeWidget MyAppBar(BuildContext context, {required label}) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColorHeavy,
    leading: MaterialButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Icon(Icons.arrow_back, size: 30, color: Colors.white),
    ),
    title: Text(
      label,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
    ),
  );
}
