import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/login_signup_screen.dart';
import 'package:employee_attendance/widgets/call_action_button.dart';
import 'package:employee_attendance/widgets/clickable_text.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPInputScreen extends StatelessWidget {
  const OTPInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                Text('Verify Phone', style: kCardTitleTextStyle),
                SizedBox(height: 10),
                Text(
                  'Code has been sent to +234812365177',
                  style: kCardDescriptionTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(height: 80),
                // InputOTP(),
                Text(
                  "Didn't get OTP Code ?",
                  style: kCardDescriptionTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                ClickableText(
                  "Resend Code",
                  onPressed: () {},
                ),
              ],
            ),
            CallActionButton(
              margin: EdgeInsets.all(20),
              label: 'Verify',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class InputOTP extends StatelessWidget {
  // void function(dynamic)
  const InputOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(114, 178, 238, 1), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 0.1),
      ),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s!.length == 4 ? null : 'Type your 4 digit pin';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onChanged: (pin) {
        if (pin.length == 4) {
          print(pin);
          Navigator.push(
            context,
            PageTransition(
              LoginSignUpScreen(),
            ),
          );
        }
      },
    );
  }
}
