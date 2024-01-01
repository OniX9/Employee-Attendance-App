import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final AlignmentGeometry direction;

  PageTransition(this.page, {this.direction = Alignment.bottomCenter})
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1900),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: direction,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0,
          child: page,
        ),
      );
    },
  );
}