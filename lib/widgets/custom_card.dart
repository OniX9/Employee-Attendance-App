import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;

  const CustomCard({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 12),
        width: double.maxFinite,
        height: 105,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
    );
  }
}