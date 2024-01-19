import 'package:flutter/foundation.dart';

class AttendanceReportUIProvider with ChangeNotifier {
  bool _isReportPopUpVisible = false;

  bool get isReportPopUpVisible => _isReportPopUpVisible;

  void toggleReportPopUpVisible() {
    _isReportPopUpVisible = !_isReportPopUpVisible;
    print('isReportPopUpVisible: $_isReportPopUpVisible');
    notifyListeners();
  }
}
