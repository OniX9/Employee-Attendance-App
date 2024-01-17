import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final IconData icon;

  const MenuButton({
    required this.onPressed,
    this.color = Colors.white,
    this.icon = Icons.more_vert_rounded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Transform.scale(
        scaleY: 1.2,
        child: Icon(icon, size: 35),
      ),
      color: color,
    );
  }
}