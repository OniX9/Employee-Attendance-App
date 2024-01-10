import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:employee_attendance/constants.dart';

class PhoneNoTextField extends StatelessWidget {
  final bool disableLengthCheck;

  const PhoneNoTextField({
    this.disableLengthCheck = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          IntlPhoneField(
            disableLengthCheck: disableLengthCheck,
            flagsButtonMargin: EdgeInsets.only(right: 10),
            dropdownIconPosition: IconPosition.trailing,
            dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
            decoration: kAuthInputDecoration.copyWith(
              labelText: 'Phone number',
              labelStyle: DefaultTextStyle.of(context).style.copyWith(
                color: kPrimaryColorLight,
              ),
            ),
            initialCountryCode: 'US',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 65, top: 40),
            width: 30,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
