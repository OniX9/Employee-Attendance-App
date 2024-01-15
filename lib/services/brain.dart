import 'package:employee_attendance/screens/admin_attendance_report_b_screen.dart';
import 'package:flutter/material.dart';

class Brain {
  authCheck(String? email, String? password){
    if (email != null && password != null) {
      bool isEmailContentValid =
      RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      bool isPasswordShort = password.length < 7;
      bool isPasswordCorrect = email == 'onisemem10@gmail.com';
      bool isEmailCorrect = password == 1234;

      if (!isEmailContentValid){
        return AuthInputError.emailInValid;
      } else if (!isPasswordShort){
        return AuthInputError.passwordShort;
      } else if (!isPasswordCorrect){
        return AuthInputError.passwordIncorrect;
      } else if (!isEmailCorrect) {
        return AuthInputError.emailIncorrect;
      }
    } else {
      return AuthInputError.emptyField;
    }
  }

  List<Widget> getBottomReports(){
    return [
      BottomReportSlot(
        month: 'Jan 2023',
        noPunchOut: 2,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 0,
      ),
      BottomReportSlot(
        month: 'Feb 2023',
        noPunchOut: 1,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 1,
      ),
      BottomReportSlot(
        month: 'Mar 2023',
        noPunchOut: 2,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Apr 2023',
        noPunchOut: 2,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'May 2023',
        noPunchOut: 2,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Jun 2023',
        noPunchOut: 22,
        presentDay: 10,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Jul 2023',
        noPunchOut: 2,
        presentDay: 35,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Aug 2023',
        noPunchOut: 2,
        presentDay: 1,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Sep 2023',
        noPunchOut: 3,
        presentDay: 5,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Oct 2023',
        noPunchOut: 2,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Nov 2023',
        noPunchOut: 0,
        presentDay: 0,
        halfDay: 0,
        presentButAbsent: 2,
      ), BottomReportSlot(
        month: 'Dec 2023',
        noPunchOut: 9,
        presentDay: 3,
        halfDay: 0,
        presentButAbsent: 2,
      ),
    ];
  }
}

enum AuthInputError {
  emptyField,
  emailInValid,
  passwordShort,
  emailIncorrect,
  passwordIncorrect,
}