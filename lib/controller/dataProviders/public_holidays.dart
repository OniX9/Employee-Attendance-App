import 'dart:collection';
import 'package:employee_attendance/models/public_holiday.dart';
import 'package:flutter/material.dart';

class PublicHolidaysProvider with ChangeNotifier {
  List<PublicHoliday> _publicHolidays = [
    PublicHoliday(description: 'New year', date: '1 Jan 2024'),
    PublicHoliday(description: 'Ted talk', date: '18 March 2024'),
    PublicHoliday(description: 'Meet & mingle', date: '9 Feb 2024'),
  ];
  UnmodifiableListView<PublicHoliday> get publicHolidays =>
      UnmodifiableListView(_publicHolidays);
  // The getter(tasks) combined with underscore localization of tasks(i.e _tasks)
  // only allows data in _tasks to be fetched, and not modified from
  // outside the class without using the class methods.
  // Also by changing the getter(tasks) data type to <UnmodifiableListView>,
  // tasks get less modifiable.

  int get publicHolidaysCount => _publicHolidays.length;

  void updatePublicHolidays() {
    _publicHolidays;
    notifyListeners();
  }

  void addPublicHolidays(PublicHoliday newHoliday) {
    //only methods that can modify _tasks
    _publicHolidays.add(newHoliday);
    notifyListeners();
  }

  void removePublicHolidays(int index) {
    //only methods that can modify _tasks
    _publicHolidays.removeAt(index);
    notifyListeners();
  }
}
