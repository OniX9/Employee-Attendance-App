import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const CustomCard({
    this.margin,
    this.height = 105,
    this.width,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.only(top: 12),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
    );
  }
}