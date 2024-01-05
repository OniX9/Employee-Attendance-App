import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF00AFE7);

TextStyle kAuthTextStyle = const TextStyle(
  color: Colors.black87,
  fontSize: 14,
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
