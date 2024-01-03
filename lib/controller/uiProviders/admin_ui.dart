import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class AdminUIProvider with ChangeNotifier {
  bool _isAdmin = true;

  // void setAdmin(bool state) {
  //   _isAdmin = state;
  //   print('Tapped');
  //   print(_isAdmin);
  //   notifyListeners();
  // }

  bool get isAdmin => _isAdmin;

  set isAdmin(bool state) {
    _isAdmin = state;
    notifyListeners();
  }
}
