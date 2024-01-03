import 'package:flutter/foundation.dart';

class AdminUIProvider with ChangeNotifier {
  bool _isAdmin = true;

  bool get isAdmin => _isAdmin;

  set isAdmin(bool state) {
    _isAdmin = state;
    print(_isAdmin);
    notifyListeners();
  }
}
