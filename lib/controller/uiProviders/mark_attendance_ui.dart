import 'package:flutter/foundation.dart';

class MarkAttendanceUIProvider with ChangeNotifier {
  bool _isPopUpVisible = false;

  bool get isPopUpVisible => _isPopUpVisible;

  void togglePopUp() {
    _isPopUpVisible = !_isPopUpVisible;
    print('isPopUpVisible: $_isPopUpVisible');
    notifyListeners();
  }
}
