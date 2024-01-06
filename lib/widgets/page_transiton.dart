import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final AlignmentGeometry verticalDirection;

  PageTransition(this.page, {this.verticalDirection = Alignment.bottomCenter})
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1900),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: verticalDirection,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0,
          child: page,
        ),
      );
    },
  );
}