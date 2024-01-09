import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final Slide direction;

  PageTransition(
    this.page, {
    this.direction = Slide.bottom,
  }) : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1900),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );

            if (direction == Slide.bottom || direction == Slide.top) {
              // For Top & Bottom Transition
              return Align(
                alignment: direction == Slide.bottom
                    ? Alignment.bottomCenter
                    : Alignment.topCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            } else {
              // For Left & Right Transition
              return Align(
                alignment: direction == Slide.right
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  child: page,
                ),
              );
            }
          },
        );
}

enum Slide {
  top,
  bottom,
  left,
  right,
}
