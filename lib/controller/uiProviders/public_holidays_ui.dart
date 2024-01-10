import 'package:flutter/foundation.dart';

class PublicHolidaysUIProvider with ChangeNotifier {
  bool _isAddHolidaysPopUpVisible = false;

  bool get isAddHolidaysPopUpVisible => _isAddHolidaysPopUpVisible;

  void toggleAddHolidaysPopUp() {
    _isAddHolidaysPopUpVisible = !_isAddHolidaysPopUpVisible;
    print('isAddHolidaysPopUpVisible: $_isAddHolidaysPopUpVisible');
    notifyListeners();
  }
}
