import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

class CallActionButton extends StatelessWidget {
  final String label;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;

  const CallActionButton({
    this.width = double.maxFinite,
    this.margin = const EdgeInsets.symmetric(vertical: 10),
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        margin: margin,
        height: 44,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          color: kPrimaryColorLight,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}