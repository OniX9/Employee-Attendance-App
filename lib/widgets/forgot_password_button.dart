import 'package:flutter/material.dart';

// Forgot Password Button.
class ForgotPasswordButton extends StatelessWidget {
  void Function()? onPressed;

   ForgotPasswordButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 9, right: 5),
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}