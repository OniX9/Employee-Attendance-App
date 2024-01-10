import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final SlideFrom direction;

  PageTransition(
    this.page, {
    this.direction = SlideFrom.bottom,
  }) : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1900),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );

            if (direction == SlideFrom.bottom || direction == SlideFrom.top) {
              // For Top & Bottom Transition
              return Align(
                alignment: direction == SlideFrom.bottom
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
                alignment: direction == SlideFrom.right
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

enum SlideFrom {
  top,
  bottom,
  left,
  right,
}
