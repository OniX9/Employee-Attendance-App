import 'package:flutter/material.dart';

class DayAndDateText extends StatelessWidget {
  const DayAndDateText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: 1.1,
      scaleX: 0.98,
      child: Text(
        'Wed, 20 Dec 2023',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}