import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/dataProviders/calender_events.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/controller/uiProviders/salary_calculator_ui.dart';
import 'package:employee_attendance/screens/salary_amount_calculation_screen.dart';
import 'package:employee_attendance/widgets/call_action_button.dart';
import 'package:employee_attendance/widgets/clickable_text.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminSalaryCalculatorBScreen extends StatelessWidget {
  final String workerID;
  const AdminSalaryCalculatorBScreen(this.workerID, {super.key});

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<SalaryCalculatorUIProvider>(context);
    bool isAdmin = Provider.of<AdminUIProvider>(context).isAdmin;

    Widget enableCalculateAmountButtonIfIsAdmin() {
      return isAdmin
          ? CalculateAmountButton()
          : Container( // Divider
              width: double.maxFinite,
              height: 2,
              color: Colors.black12,
              margin: EdgeInsets.only(bottom: 20),
            );
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: kBlueScaffoldColor,
          appBar: MyAppBar(
            context,
            label: workerID,
            trailing: Row(
              children: [
                IconButton(icon: Icon(Icons.info, size: 30), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.share_outlined, size: 30),
                    onPressed: () {}),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: Transform.scale(
                    scaleY: 1.2,
                    child: Icon(Icons.more_vert_rounded, size: 35),
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          uiConsumer.toggleReportPopUpVisible();
                        },
                        child: Text(
                          "Show Attendance In List Format",
                          style: TextStyle(fontSize: 12),
                        ),
                        value: '/showList',
                      ),
                      PopupMenuItem(
                        child: Text(
                          "Show Attendance Position On Map",
                          style: TextStyle(fontSize: 12),
                        ),
                        value: '/showMap',
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
              enableCalculateAmountButtonIfIsAdmin(),
              MonthlyAttendanceSummaryContainer(),
            ],
          ),
        ),
        PopUpAttendanceList(),
      ],
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
            onPressed: () {
              Navigator.of(context).push(
                PageTransition(SalaryAmountCalculationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 3.
class CalenderContainer extends StatefulWidget {
  const CalenderContainer({
    super.key,
  });

  @override
  State<CalenderContainer> createState() => _CalenderContainerState();
}

class _CalenderContainerState extends State<CalenderContainer> {
  DateTime currentDateOnCalender = DateTime.now();
  DateTime currentTappedDate = DateTime.now();
  List<Map> dateMonthCache = [];

  String _getMonthText(int monthInt) {
    switch (monthInt) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

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

  bool _isCalendarInCurrentMonth() {
    bool isInCurrentMonth = currentDateOnCalender.month == DateTime.now().month;
    bool isInCurrentYear = currentDateOnCalender.year == DateTime.now().year;
    bool res = isInCurrentMonth && isInCurrentYear;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MonthView(
        controller: EventController(),
        showBorder: false,
        headerStringBuilder: (DateTime date, {DateTime? secondaryDate}) {
          return _isCalendarInCurrentMonth()
              ? '${_getMonthText(date.month)} ${date.year}'
              : '${_getMonthText(date.month)} ${date.year}';
        },
        headerStyle: HeaderStyle(
          headerTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          rightIconVisible: !_isCalendarInCurrentMonth(),
        ),
        // Custom UI for Week days.
        weekDayBuilder: (weekDayInt) {
          return Column(
            children: [
              Container(
                // A Divider
                margin: EdgeInsets.only(bottom: 6),
                width: double.maxFinite,
                color: Colors.grey[300],
                height: 1,
              ),
              Text(
                _getWeekDayText(weekDayInt),
                textAlign: TextAlign.center,
                style: kCalenderTextStyle.copyWith(
                  color: kPrimaryColorHeavy,
                ),
              ),
            ],
          );
        },
        // Custom UI for Month cells.
        cellBuilder: (date, events, isToday, isInMonth) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                new BlueCalendarMarker(
                  currentTappedDate: currentTappedDate,
                  isToday: isToday,
                  date: date,
                  child: Text(
                    isInMonth ? date.day.toString() : '',
                    style: kCalenderTextStyle.copyWith(
                      color: isToday ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                new GetCalenderHolidayPunchInOutBox(
                  date: date,
                  isInMonth: isInMonth,
                  // dateEventCache:,
                )
              ],
            ),
          );
        },
        minMonth: DateTime(2005),
        maxMonth: DateTime.now(),
        initialMonth: DateTime.now(),
        cellAspectRatio: 3 / 3.5,
        onPageChange: (newDate, pageIndex) {
          setState(() {
            currentDateOnCalender = newDate;
          });
          print("$newDate, $pageIndex");
        },
        onCellTap: (events, newDate) {
          // Implement callback when user taps on a cell.
          setState(() {
            currentTappedDate = newDate;
          });
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
  final DateTime currentTappedDate;
  final DateTime date;
  final bool isToday;
  final Widget child;

  const BlueCalendarMarker({
    required this.currentTappedDate,
    required this.date,
    required this.isToday,
    required this.child,
    super.key,
  });
  bool _isAboveToday() {
    bool isTappedDateAboveToday = DateUtils.dateOnly(currentTappedDate).isAfter(
      DateUtils.dateOnly(DateTime.now()),
    );
    return isTappedDateAboveToday;
  }

  bool _isCurrentSelected() {
    bool isTodayTapped =
        DateUtils.dateOnly(currentTappedDate) == DateUtils.dateOnly(date);
    return isTodayTapped;
  }

  @override
  Widget build(BuildContext context) {
    Color isMarkerVisible = isToday ? kPrimaryColorLight : Colors.transparent;
    Color isOutterMarkerVisible = _isCurrentSelected() && !_isAboveToday()
        ? kPrimaryColorLight
        : Colors.transparent;
    return AnimatedScale(
      duration: Duration(milliseconds: 1000),
      scale: _isCurrentSelected() && !_isAboveToday() ? 1.19 : 1,
      curve: Curves.elasticInOut,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isOutterMarkerVisible, width: 1),
        ),
        child: Container(
          padding: EdgeInsets.only(right: 0),
          alignment: Alignment.center,
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: isMarkerVisible,
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}

class GetCalenderHolidayPunchInOutBox extends StatelessWidget {
  final DateTime date;
  final bool isInMonth;
  // final List<Map> dateEventCache;

  const GetCalenderHolidayPunchInOutBox({
    required this.date,
    required this.isInMonth,
    // required this.dateEventCache,
    super.key,
  });

  bool _isAboveToday() {
    bool isDateAboveToday = DateUtils.dateOnly(date).isAfter(
      DateUtils.dateOnly(DateTime.now()),
    );
    return isDateAboveToday;
  }

  Map<String, dynamic> dateHasEvent(List mappedDateMonthCache) {
    Map<String, int> dateMonthMap = {'day': date.day, 'month': date.month};
    int index = mappedDateMonthCache.indexWhere((map) =>
        map['day'] == dateMonthMap['day'] &&
        map['month'] == dateMonthMap['month']);
    bool doesDateHaveEvent = index != -1;
    return {'dateHasEvent': doesDateHaveEvent, 'index': index};
  }

  @override
  Widget build(BuildContext context) {
    var calenderDataConsumer = Provider.of<CalenderEventsProvider>(context);
    Map<String, dynamic> hasEvent =
        dateHasEvent(calenderDataConsumer.dateMonthCache);
    if (!hasEvent['dateHasEvent']) {
      return isInMonth && !_isAboveToday()
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
    } else {
      String? punchIn =
          calenderDataConsumer.calenderEvents[hasEvent['index']].punchIn;
      String? punchOut =
          calenderDataConsumer.calenderEvents[hasEvent['index']].punchOut;
      String? nonWorkingDayReason = calenderDataConsumer
          .calenderEvents[hasEvent['index']].nonWorkingDayReason;

      if (nonWorkingDayReason == null) {
        return isInMonth && !_isAboveToday()
            ? Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.only(top: 3),
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      punchIn ?? 'N/A',
                      style: kCalenderTextStyle.copyWith(
                        fontSize: punchIn == null ? 11 : 9,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      punchOut ?? 'N/A',
                      style: kCalenderTextStyle.copyWith(
                        fontSize: punchOut == null ? 11 : 9,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(height: 30);
      } else {
        return isInMonth && !_isAboveToday()
            ? Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.only(top: 3),
                height: 30,
                width: 40,
                child: Text(
                  nonWorkingDayReason,
                  textAlign: TextAlign.center,
                  style: kCalenderTextStyle.copyWith(
                    fontSize: 10,
                    color: Colors.red,
                  ),
                ),
              )
            : SizedBox(height: 30);
      }
    }
  }
}

//..

class PopUpAttendanceList extends StatelessWidget {
  const PopUpAttendanceList({
    super.key,
  });

  final TextStyle reportTextStyle = const TextStyle(
    color: Color(0xB60B4DA5),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  SizedBox _buildHeadingText(String text,
      {Color? color = Colors.white, double? width}) {
    return SizedBox(
      width: width,
      child: Text(text,
          textAlign: TextAlign.center,
          style: reportTextStyle.copyWith(
            color: color,
          )),
    );
  }

  SizedBox _buildBodyText(
    String text, {
    double? width,
    Color? color = const Color(0xFF616161),
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: reportTextStyle.copyWith(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Column _buildReportBodyWidget({
    required int date,
    AttendanceType type = AttendanceType.absentDay,
    String? punchIn,
    String? punchOut,
  }) {
    Color? _getColor() {
      switch (type) {
        case AttendanceType.presentButAbsent:
          return Colors.yellow[600];
        case AttendanceType.noPunchOut:
          return Colors.green;
        case AttendanceType.absentDay:
          return Colors.red;
        default:
          return Colors.red;
      }
    }

    String _getTypeString() {
      switch (type) {
        case AttendanceType.presentButAbsent:
          return 'Present But Abs...';
        case AttendanceType.noPunchOut:
          return 'No Punch-Out';
        case AttendanceType.absentDay:
          return 'Absent Day';
        default:
          return 'Absent Day';
      }
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBodyText(
                date.toString().padLeft(2, '0'),
                color: _getColor(),
                width: 40,
              ),
              _buildBodyText('0', width: 40),
              _buildBodyText(punchIn ?? '-', width: 55),
              _buildBodyText(punchOut ?? '-', width: 55),
              _buildBodyText(_getTypeString(), width: 72),
            ],
          ),
        ),
        Container(color: Colors.black12, height: 1),
      ],
    );
  }

  Container _buildReportHeadingWidget() {
    return Container(
      width: double.maxFinite,
      height: 30,
      color: kPrimaryColorHeavy,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeadingText('DATE', width: 40),
            _buildHeadingText('DAYS', width: 40),
            _buildHeadingText('IN', width: 55),
            _buildHeadingText('OUT', width: 55),
            _buildHeadingText('TYPE', width: 72),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<SalaryCalculatorUIProvider>(context);
    return AnimatedOpacity(
      opacity: uiConsumer.isReportPopUpVisible ? 1 : 0,
      duration: Duration(milliseconds: 400),
      child: Visibility(
        visible: uiConsumer.isReportPopUpVisible,
        child: GestureDetector(
          onTap: () {
            uiConsumer.toggleReportPopUpVisible();
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.black38,
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  //  GestureDetector makes Popup insensitive to touch
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Oct 2023',
                          style: reportTextStyle,
                        ),
                      ),
                      _buildReportHeadingWidget(),
                      Expanded(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            _buildReportBodyWidget(
                              date: 1,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 2,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 3,
                              type: AttendanceType.presentButAbsent,
                              punchIn: '08:09 AM',
                              punchOut: '11:06 AM',
                            ),
                            _buildReportBodyWidget(
                              date: 4,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 5,
                              type: AttendanceType.presentButAbsent,
                              punchIn: '11:09 AM',
                              punchOut: '02:06 PM',
                            ),
                            _buildReportBodyWidget(
                              date: 6,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 7,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 8,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 9,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 10,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 11,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 12,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 13,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 14,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 15,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 16,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 17,
                              type: AttendanceType.noPunchOut,
                              punchIn: '12:26 PM',
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 18,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 19,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 20,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 21,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 22,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                            _buildReportBodyWidget(
                              date: 23,
                              type: AttendanceType.absentDay,
                              punchIn: null,
                              punchOut: null,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ClickableText(
                          'OK',
                          fontSize: 15,
                          onPressed: () {
                            uiConsumer.toggleReportPopUpVisible();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AttendanceType {
  presentButAbsent,
  absentDay,
  noPunchOut,
}
