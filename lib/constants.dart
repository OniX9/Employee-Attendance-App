import 'package:flutter/material.dart';

Color kPrimaryColorLight = const Color(0xFF00AFE7);

Color kPrimaryColorHeavy = const Color(0xFF0046A3);

TextStyle kAuthTextStyle = const TextStyle(
  color: Colors.black87,
  fontSize: 14,
);

TextStyle kHeading1Textstyle = const TextStyle(
  fontSize: 22,
  color: Colors.white,
);

TextStyle kSettingsTextStyle = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Color(0xFF424242),
);

InputDecoration kAuthInputDecoration = const InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF00AFE7),
      width: 3,
    )
  ),
  labelStyle: TextStyle(
    color: Colors.grey,
    fontSize: 14,
  ),
);
