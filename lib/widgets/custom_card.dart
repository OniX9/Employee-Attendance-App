import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;

  const CustomCard({
    this.margin,
    this.padding,
    this.height = 105,
    this.width,
    this.child,
    this.borderRadius,
    this.alignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.only(top: 12),
        padding: padding,
        alignment: alignment,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: child,
    );
  }
}