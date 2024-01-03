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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        constraints: BoxConstraints(maxWidth: 400),
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
              blurRadius: 6,
              color: Colors.black,
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
    final path = Path();
    if (position == Cut.bottom) {
      print(size.height);
      path.lineTo(0.0, size.height - 43.0);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
      path.close();
      return path;
    } else {
      path.lineTo(0.0, 0.0);
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, size.height- 100);
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
