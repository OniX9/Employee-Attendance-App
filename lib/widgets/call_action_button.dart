import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

class CallActionButton extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;

  const CallActionButton({
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
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 42,
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: kPrimaryColorLight,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}