import 'package:flutter/material.dart';

Color kPrimaryColorLight = const Color(0xFF00AFE7);

Color kPrimaryColorHeavy = const Color(0xFF0046A3);

Color? kBlueScaffoldColor = const Color(0xFFE5F2F3);

TextStyle kAuthTextStyle = const TextStyle(
  color: Colors.black87,
  fontSize: 14,
);

TextStyle kCheckLabelTextStyle = const TextStyle(
  color: Color(0xFF898888),
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle kCardTitleTextStyle = const TextStyle(
  color: Color(0xFF616161),
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

TextStyle kCardDescriptionTextStyle = const TextStyle(
  color: Color(0xFF757575),
  fontSize: 11,
);

TextStyle kHeadingTextstyle = const TextStyle(
  fontSize: 22,
  color: Colors.white,
);

TextStyle kSettingsTextStyle = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Color(0xFF424242),
);

TextStyle kPublicHolidaysTextStyle = TextStyle(
  fontSize: 16.5,
  fontWeight: FontWeight.w500,
  color: Colors.grey[700],
);

TextStyle kNotesRulesTextStyle = TextStyle(
  fontSize: 16.5,
  fontWeight: FontWeight.w500,
  color: Colors.grey[700],
);

TextStyle kCalenderTextStyle = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

BoxDecoration kDividerBoxDecoration =  BoxDecoration(
  border: Border.fromBorderSide( BorderSide(color: Colors.black38, width: 0.5),
  ),
);

InputDecoration kAuthInputDecoration = const InputDecoration(
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xFF00AFE7),
    width: 3,
  )),
  labelStyle: TextStyle(
    color: Colors.grey,
    fontSize: 14,
  ),
);

InputDecoration kPopUpInputDecoration = const InputDecoration(
  filled: true,
  fillColor: Color(0xFFEEEEEE),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  hintStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black26,
  ),
);
