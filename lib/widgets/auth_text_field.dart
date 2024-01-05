import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

// 2. Login and SignUp TextField.
enum AuthType {
  name,
  email,
  password,
  phoneNumber,
}

class AuthTextField extends StatelessWidget {
  final AuthType type;

  const AuthTextField(
    this.type, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String labelText() {
      switch (type) {
        case AuthType.name:
          return 'Name';
        case AuthType.email:
          return 'Email Id';
        case AuthType.password:
          return 'password';
        case AuthType.phoneNumber:
          return 'Mobile NO';
        default:
          return 'Error !';
      }
    }
    IconData prefixIcon() {
      switch (type) {
        case AuthType.name:
          return Icons.person;
        case AuthType.email:
          return Icons.mail ;
        case AuthType.password:
          return Icons.lock;
        case AuthType.phoneNumber:
          return Icons.phone;
        default:
          return Icons.warning_amber;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        onChanged: (newText) {},
        style: kAuthTextStyle,
        obscureText: type == AuthType.password,
        cursorColor: kPrimaryColor,
        decoration: kAuthInputDecoration.copyWith(
          labelText: labelText(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              prefixIcon(),
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
