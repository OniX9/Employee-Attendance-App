import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/phone_no_textfield.dart';
import 'package:flutter/material.dart';
import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/call_action_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, label: 'Forgot password'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              PhoneNoTextField(),
              SizedBox(height: 10),
              CallActionButton(
                label: 'VERIFY PHONE NUMBER',
                onPressed: () {
                  // Navigator.of(context).push();
                },
              ),
              SizedBox(height: 15),
              Text(
                'By tapping "Verify Phone Number", an SMS may be sent. Message & date rates may apply.',
                style: TextStyle(
                  fontSize: 15.5,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}