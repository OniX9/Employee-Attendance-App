import 'package:flutter/foundation.dart';

class NotesRulesUIProvider with ChangeNotifier {
  bool _isAddNotesRulesPopUpVisible = false;

  bool get isAddNotesRulesPopUpVisible => _isAddNotesRulesPopUpVisible;

  void toggleAddNotesRulesPopUp() {
    _isAddNotesRulesPopUpVisible = !_isAddNotesRulesPopUpVisible;
    print('isAddNotesRulesPopUpVisible: $_isAddNotesRulesPopUpVisible');
    notifyListeners();
  }
}