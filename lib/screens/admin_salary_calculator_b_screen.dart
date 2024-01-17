import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/call_action_button.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class AdminSalaryCalculatorBScreen extends StatelessWidget {
  final String workerID;
  const AdminSalaryCalculatorBScreen(this.workerID, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      appBar: MyAppBar(
        context,
        label: workerID,
        trailing: Row(
          children: [
            IconButton(icon: Icon(Icons.info, size: 30), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.share_outlined, size: 30), onPressed: () {}),
            PopupMenuButton(
              padding: EdgeInsets.zero,
              icon: Transform.scale(
                scaleY: 1.2,
                child: Icon(Icons.more_vert_rounded, size: 35),
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    child: Text(
                      "Show Attendance In List Format",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: '/list',
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Show Attendance Position On Map",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: '/Map',
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CalenderContainer(),
          CalculateAmountButton(),
          MonthlyAttendanceSummaryContainer(),
        ],
      ),
    );
  }
}

//**CUSTOM ATTENDANCE**
// 1.
class MonthlyAttendanceSummaryContainer extends StatelessWidget {
  const MonthlyAttendanceSummaryContainer({
    super.key,
  });
  Column _buildHeadingAndAmount(
    String text,
    double? numberOfTimes, {
    Color? color = Colors.black,
  }) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          numberOfTimes!.toStringAsFixed(0),
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeadingAndAmount('No Punch-Out', 1, color: Colors.green),
          _buildHeadingAndAmount('Present Day', 0, color: Colors.blue[600]),
          _buildHeadingAndAmount('Half Day', 0, color: Colors.cyan),
          _buildHeadingAndAmount('Present But Absent', 0, color: Colors.red),
        ],
      ),
    );
  }
}

// 2.
class CalculateAmountButton extends StatelessWidget {
  const CalculateAmountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 2,
            width: double.maxFinite,
            color: kPrimaryColorLight,
          ),
          CallActionButton(
            margin: EdgeInsets.zero,
            width: 270,
            label: 'CALCULATE AMOUNT',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// 3.
class CalenderContainer extends StatelessWidget {
  const CalenderContainer({
    super.key,
  });

  String _getWeekDayText(int weekDayInt) {
    switch (weekDayInt) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thur';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MonthView(
        controller: EventController(),
        showBorder: false,
        weekDayBuilder: (weekDayInt) {
          // to provide custom UI for Week day cells.
          return Text(
            _getWeekDayText(weekDayInt),
            textAlign: TextAlign.center,
            style: kCalenderTextStyle.copyWith(
              color: kPrimaryColorHeavy,
            ),
          );
        },
        cellBuilder: (date, events, isToday, isInMonth) {
          // to provide custom UI for Month cells.
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                BlueCalendarMarker(
                  isToday: isToday,
                  child: Text(
                    isInMonth ? date.day.toString() : '',
                    style: kCalenderTextStyle,
                  ),
                ),
                GetCalenderHolidayPunchInOutBox(
                  isInMonth: isInMonth,
                )
              ],
            ),
          );
        },
        minMonth: DateTime(1990),
        maxMonth: DateTime(2050),
        initialMonth: DateTime.now(),
        cellAspectRatio: 3 / 3.5,
        onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
        onCellTap: (events, date) {
          // Implement callback when user taps on a cell.
          print(events);
          print(date);
        },
        startDay: WeekDays.sunday, // To change the first day of the week.
        // This callback will only work if cellBuilder is null.
        onEventTap: (event, date) => print(event),
        onDateLongPress: (date) => print(date),
      ),
    );
  }
}

class BlueCalendarMarker extends StatelessWidget {
  final bool isToday;
  final Widget child;

  const BlueCalendarMarker({
    required this.isToday,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color isMarkerVisible = isToday ? kPrimaryColorLight : Colors.transparent;
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isMarkerVisible, width: 1),
      ),
      child: Container(
        padding: EdgeInsets.only(right: 2),
        alignment: Alignment.center,
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: isMarkerVisible,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}

class GetCalenderHolidayPunchInOutBox extends StatelessWidget {
  final bool isInMonth;
  const GetCalenderHolidayPunchInOutBox({required this.isInMonth, super.key});

  @override
  Widget build(BuildContext context) {
    return isInMonth && true
        ? Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(top: 3),
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
              children: [
                Text(
                  'N/A',
                  style: kCalenderTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'N/A',
                  style: kCalenderTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        : SizedBox(height: 30);
  }
}
