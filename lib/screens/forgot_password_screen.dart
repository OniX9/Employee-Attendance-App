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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColorHeavy,
        leading: MaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, size: 30, color: Colors.white),
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
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

// CUSTOM WIDGETS
class PhoneNoTextField extends StatelessWidget {
  const PhoneNoTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonMargin: EdgeInsets.only(right: 10),
      dropdownIconPosition: IconPosition.trailing,
      decoration:kAuthInputDecoration.copyWith(
              labelText: 'Phone number',
              labelStyle: DefaultTextStyle.of(context).style.copyWith(
                    color: kPrimaryColorLight,
                  ),
      ),
      initialCountryCode: 'US',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}

// class PhoneNoTextField extends StatelessWidget {
//   const PhoneNoTextField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.22,
//           child: DropdownButton(
//             value: 'Nigeria',
//             items: [
//               DropdownMenuItem(
//                 value: 'Nigeria',
//                 child: Row(
//                   children: [
//                     SvgPicture.asset('assets/images/country_flags/nigeria.svg'),
//                     Text('+234'),
//                   ],
//                 ),
//               ),
//               DropdownMenuItem(
//                 value: 'USA',
//                 child: Row(
//                   children: [
//                     SvgPicture.asset('assets/images/country_flags/united_states.svg'),
//                     Text('+001'),
//                   ],
//                 ),
//               ),
//             ],
//             onChanged: (value){},
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.7,
//           child: TextField(
//             onChanged: (newText) {},
//             style: kAuthTextStyle,
//             cursorColor: kPrimaryColorLight,
//             decoration: kAuthInputDecoration.copyWith(
//               labelText: 'Phone number',
//               labelStyle: DefaultTextStyle.of(context).style.copyWith(
//                     color: kPrimaryColorLight,
//                   ),
//               prefixIcon: null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
