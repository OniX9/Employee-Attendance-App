import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final void Function()? onPressed;

  const MenuButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: 1.2,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.more_vert_rounded, size: 35),
      ),
    );
  }
}