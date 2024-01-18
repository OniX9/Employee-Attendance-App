import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:employee_attendance/models/daily_calender_event.dart';

class CalenderEventsProvider with ChangeNotifier {
  List<Map> dateMonthCache = [
    {'day': 1, 'month': 1},
    {'day': 3, 'month': 1},
    {'day': 18, 'month': 3},
    {'day': 9, 'month': 2},
  ];

  List<DailyCalenderEvent> _calenderEvents = [
    DailyCalenderEvent(nonWorkingDayReason: 'New year', day: 1, month: 1),
    DailyCalenderEvent(
        nonWorkingDayReason: null, day: 3, month: 1, punchIn: '9:00PM'),
    DailyCalenderEvent(nonWorkingDayReason: 'New year', day: 1, month: 1),
    DailyCalenderEvent(nonWorkingDayReason: 'Ted talk', day: 18, month: 3),
    DailyCalenderEvent(nonWorkingDayReason: 'Meet & mingle', day: 9, month: 2),
  ];

  UnmodifiableListView<DailyCalenderEvent> get calenderEvents =>
      UnmodifiableListView(_calenderEvents);
  // The getter(tasks) combined with underscore localization of tasks(i.e _tasks)
  // only allows data in _tasks to be fetched, and not modified from
  // outside the class without using the class methods.
  // Also by changing the getter(tasks) data type to <UnmodifiableListView>,
  // tasks get less modifiable.

  int get publicHolidaysCount => _calenderEvents.length;

  void updateCalenderEvent() {
    _calenderEvents;
    notifyListeners();
  }

  void addCalenderEvent(DailyCalenderEvent calenderEvent) {
    //only methods that can modify Calendar Events
    _calenderEvents.add(calenderEvent);
    notifyListeners();
  }

  void removeCalenderEvent(int index) {
    //only methods that can modify _tasks
    _calenderEvents.removeAt(index);
    notifyListeners();
  }
  // void _cachedDateMonth(){
  //   _calenderEvents.forEach((event){
  //     dateMonthCache.add(
  //         {'day': event.day,
  //           'month': event.month});
  //   });
  //   print(dateMonthCache);
  // }
}
