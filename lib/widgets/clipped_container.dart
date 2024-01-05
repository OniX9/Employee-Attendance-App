import 'package:flutter/material.dart';

class ClippedContainer extends StatelessWidget {
  final Cut clipPosition;
  final Widget? child;
  final double? height;

  const ClippedContainer({
    required this.clipPosition,
    this.child,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalClipper(clipPosition),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.all(5),
        constraints: clipPosition == Cut.bottom
            ? BoxConstraints(maxWidth: 390, maxHeight: 480)
            : BoxConstraints(maxWidth: 390, maxHeight: 160),
        width: double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: clipPosition == Cut.bottom
              ? BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.5,
              spreadRadius: 2.5,
              color: Colors.black12,
              offset: clipPosition == Cut.bottom ? Offset(0, -5) : Offset(0, 5),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  late Cut position;

  DiagonalClipper(this.position);
  @override
  Path getClip(Size size) {
    if (position == Cut.bottom) {
      print(size.height);
      final path = Path()
        ..moveTo(0.0, size.height * 0.895) // starting point at the bottom-left
        ..lineTo(0, size.height * 0.26) // line to the top-left (Borderside left)
        // ADD TOP LEFT CURVE HERE, PROBABLY USE arcToPoint or Bezier
        ..quadraticBezierTo(0, size.height * 0.14,
            size.width * 0.05, size.height * 0.14) // (left Borderside Curve)
      ..lineTo(size.width * 0.05, size.height * 0.14) // top-left (Borderside right)
        ..lineTo(size.width * 0.35, size.height * 0.14) // point at arc's left
        ..arcToPoint(
          Offset(size.width * 0.65, size.height * 0.125),
          radius: Radius.circular(size.width * 0.15),
          clockwise: true,
        ) // arc to the top-right
        ..lineTo(
            size.width * 0.65, size.height * 0.14) // point at arc's right
        ..lineTo(size.width * 0.95,
            size.height * 0.14) // top-right (Borderside left)
        // ADD THE TOP RIGHT CURVE HERE, PROBABLY USE arcToPoint or Bezier
        ..quadraticBezierTo(size.width, size.height * 0.14,
            size.width, size.height * 0.25) // (right Borderside Curve)
        ..lineTo(size.width, size.height * 0.25) // top-right (Borderside right)
        ..lineTo(size.width, size.height) // line to the bottom-right
        ..close(); // close the path
      return path;
    } else {
      final path = Path();

      print(size.height);
      path.lineTo(0.0, 0.0);
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, size.height * 0.268);
      path.close();
      return path;
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

enum Cut {
  top,
  bottom,
}

// if (position == Cut.bottom) {
// print(size.height);
// path.lineTo(0.0, size.height * 0.895);
// path.lineTo(size.width, size.height);
// path.lineTo(size.width, 0.0);
// path.lineTo(0, 0.0);
// path.close();
// return path;
// }
