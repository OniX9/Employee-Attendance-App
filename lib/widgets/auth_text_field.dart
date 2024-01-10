import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

// 2. Login and SignUp TextField.
enum AuthType {
  name,
  email,
  password,
  currency,
  phoneNumber,
  designation,
  dateOfBirth,
  employeeName,
  employeeAddress,
}

class AuthTextField extends StatelessWidget {
  final AuthType type;
  final bool hidePrefixIcon;
  final bool showObscureText;

  const AuthTextField(
    this.type, {
    this.hidePrefixIcon = false,
    this.showObscureText = false,
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
        case AuthType.designation:
          return 'Designation ( Exe, Employee, Manager';
        case AuthType.dateOfBirth:
          return 'Date Of Birth';
        case AuthType.employeeName:
          return 'Employee Name';
        case AuthType.employeeAddress:
          return 'Employee Address';
        case AuthType.currency:
          return 'Currency Symbol';
        default:
          return 'Error !';
      }
    }

    IconData prefixIcon() {
      switch (type) {
        case AuthType.name:
          return Icons.person;
        case AuthType.email:
          return Icons.mail;
        case AuthType.password:
          return Icons.lock;
        case AuthType.phoneNumber:
          return Icons.phone;
        default:
          return Icons.warning_amber;
      }
    }

    TextInputType? keyboardType() {
      switch (type) {
        case AuthType.name:
          return TextInputType.name;
        case AuthType.email:
          return TextInputType.emailAddress;
        case AuthType.password:
          return null;
        case AuthType.phoneNumber:
          return TextInputType.phone;
        default:
          return null;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        keyboardType: keyboardType(),
        onChanged: (newText) {},
        style: kAuthTextStyle,
        obscureText: type == AuthType.password && !showObscureText,
        cursorColor: kPrimaryColorLight,
        decoration: kAuthInputDecoration.copyWith(
          labelText: labelText(),
          prefixIcon: hidePrefixIcon ? null : Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              prefixIcon(),
              color: kPrimaryColorLight,
            ),
          ),
        ),
      ),
    );
  }
}
