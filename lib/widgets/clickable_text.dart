import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final void Function()? onPressed;

  const ClickableText(this.data, {
    required this.onPressed,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(data,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: kPrimaryColorLight,
        ),
      ),
    );
  }
}