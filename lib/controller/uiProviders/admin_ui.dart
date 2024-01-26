import 'package:flutter/foundation.dart';

class AdminUIProvider with ChangeNotifier {
  bool _isAdmin = true;

  bool get isAdmin => _isAdmin;

  set isAdmin(bool state) {
    _isAdmin = state;
    print(_isAdmin);
    notifyListeners();
  }

  // Add Public Holidays PopUp
  bool _isAddHolidaysPopUpVisible = false;

  bool get isAddHolidaysPopUpVisible => _isAddHolidaysPopUpVisible;

  void toggleAddHolidaysPopUp() {
    _isAddHolidaysPopUpVisible = !_isAddHolidaysPopUpVisible;
    print('isAddHolidaysPopUpVisible: $_isAddHolidaysPopUpVisible');
    notifyListeners();
  }

  // Send Broadcast PopUp
  bool _isBroadCastPopUpVisible = false;

  bool get isBroadCastPopUpVisible => _isBroadCastPopUpVisible;

  void toggleBroadCastPopUp() {
    _isBroadCastPopUpVisible = !_isBroadCastPopUpVisible;
    print('isBroadCastPopUpVisible: $_isBroadCastPopUpVisible');
    notifyListeners();
  }

  // Admin ChangePassword PopUp
  bool _isAChangePasswordPopUpVisible = false;

  bool get isAChangePasswordPopUpVisible => _isAChangePasswordPopUpVisible;

  void toggleAChangePasswordPopUp() {
    _isAChangePasswordPopUpVisible = !_isAChangePasswordPopUpVisible;
    print('isChangePasswordPopUpVisible: $_isAChangePasswordPopUpVisible');
    notifyListeners();
  }

  // Employee ChangePassword PopUp
  bool _isEChangePasswordPopUpVisible = false;

  bool get isEChangePasswordPopUpVisible => _isEChangePasswordPopUpVisible;

  void toggleEChangePasswordPopUp() {
    _isEChangePasswordPopUpVisible = !_isEChangePasswordPopUpVisible;
    print('isEChangePasswordPopUpVisible: $_isEChangePasswordPopUpVisible');
    notifyListeners();
  }
}
