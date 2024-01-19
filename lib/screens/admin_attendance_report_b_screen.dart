import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/uiProviders/attendance_report_ui.dart';
import 'package:employee_attendance/services/brain.dart';
import 'package:employee_attendance/widgets/call_action_button.dart';
import 'package:employee_attendance/widgets/clickable_text.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

final bool isPopup = false;

class AdminAttendanceReportBScreen extends StatelessWidget {
  final String workersID;
  const AdminAttendanceReportBScreen(this.workersID, {super.key});

  @override
  Widget build(BuildContext context) {
    var reportUIConsumer = Provider.of<AttendanceReportUIProvider>(context);
    final double bottomSheetMinExtent = 150;
    Widget _backgroundWidget() {
      return Scaffold(
        appBar: MyAppBar(context, label: workersID),
        body: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MonthFromToButton(
                  onPressed: (){},
                ),
                SizedBox(width: 23),
                MonthFromToButton(
                  onPressed: (){},
                  isStartingMonth: false,
                ),
              ],
            ),
            CallActionButton(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              label: 'Show Report',
              onPressed: () {
                reportUIConsumer.toggleReportPopUpVisible();
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomSheetMinExtent),
                child: AttendancePieChart(),
              ),
            ),
          ],
        ),
      );
    }

    Widget _previewWidget() {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            BottomReportHeadings(),
            BottomReportSlot(
              month: 'Jan 2023',
              noPunchOut: 2,
              presentDay: 0,
              halfDay: 0,
              presentButAbsent: 0,
            ),
            BottomReportSlot(
              month: 'Feb 2023',
              noPunchOut: 2,
              presentDay: 0,
              halfDay: 0,
              presentButAbsent: 0,
            ),
            BottomReportSlot(
              month: 'Mar 2023',
              noPunchOut: 2,
              presentDay: 0,
              halfDay: 0,
              presentButAbsent: 0,
            )
          ],
        ),
      );
    }

    Widget _expandedWidget() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            BottomReportHeadings(
              isBottomSheetExpanded: true,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: Brain().getBottomReports(),
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        DraggableBottomSheet(
          minExtent: bottomSheetMinExtent,
          useSafeArea: false,
          curve: Curves.easeIn,
          previewWidget: _previewWidget(),
          expandedWidget: _expandedWidget(),
          backgroundWidget: _backgroundWidget(),
          maxExtent: 390,
          onDragging: (pos) {},
        ),
        PopUpReport(),
      ],
    );
  }
}

class BottomReportHeadings extends StatelessWidget {
  final bool isBottomSheetExpanded;
  const BottomReportHeadings({
    this.isBottomSheetExpanded = false,
    super.key,
  });

  SizedBox _buildHeadingText(String text,
      {Color? color = Colors.black, double? width}) {
    return SizedBox(
      width: width,
      child: Material(
        color: kBlueScaffoldColor,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 30),
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
        color: kBlueScaffoldColor,
        borderRadius: isBottomSheetExpanded
            ? BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )
            : null,
      ),
      child: Row(
        children: [
          _buildHeadingText('Month'),
          Expanded(child: SizedBox()),
          _buildHeadingText('No Punch...', color: Colors.green, width: 60),
          _buildHeadingText('Present Day', color: Colors.blue[600], width: 65),
          _buildHeadingText('Half Day', color: Colors.cyan, width: 55),
          _buildHeadingText('Present But...', color: Colors.red, width: 65),
        ],
      ),
    );
  }
}

class BottomReportSlot extends StatelessWidget {
  final String month;
  final double? noPunchOut;
  final double? presentDay;
  final double? halfDay;
  final double? presentButAbsent;

  const BottomReportSlot({
    required this.month,
    this.noPunchOut = 0,
    this.presentDay = 0,
    this.halfDay = 0,
    this.presentButAbsent = 0,
    super.key,
  });

  SizedBox _buildHeadingText(String text,
      {Color? color = Colors.black, double? width}) {
    return SizedBox(
      width: width,
      child: Center(
        child: Material(
          child: Text(
            text == '0.0' ? '-' : text,
            style: TextStyle(
              color: color,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 33,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 20, top: 9, bottom: 9),
            child: Row(
              children: [
                _buildHeadingText(month),
                Expanded(child: SizedBox()),
                _buildHeadingText(
                  noPunchOut.toString(),
                  color: Colors.green,
                  width: 60,
                ),
                _buildHeadingText(
                  presentDay.toString(),
                  color: Colors.blue[600],
                  width: 65,
                ),
                _buildHeadingText(
                  halfDay.toString(),
                  color: Colors.cyan,
                  width: 55,
                ),
                _buildHeadingText(
                  presentButAbsent.toString(),
                  color: Colors.red,
                  width: 65,
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

// **CUSTOM WIDGETS**
//1.
class AttendancePieChart extends StatelessWidget {
  const AttendancePieChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "No Punch-Out": 4.00,
      "Present But Absent": 3.00,
    };
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width * 0.55,
      colorList: [Colors.green, Colors.red],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 60,
      formatChartValues: (numValue) => numValue == dataMap["No Punch-Out"]
          ? '''$numValue
     No Punch-Out'''
          : '''$numValue
     Present But Absent''',
      centerWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Attendance',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          Text(
            'Records',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      legendOptions: LegendOptions(
        showLegends: false,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: true,
        decimalPlaces: 2,
        chartValueStyle: TextStyle(
          fontSize: 11,
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}

// 2.
class MonthFromToButton extends StatelessWidget {
  final bool isStartingMonth;
  final void Function() onPressed;

  const MonthFromToButton({
    required this.onPressed,
    this.isStartingMonth = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        height: 30,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_rounded,
              size: 22,
              color: isStartingMonth ? Colors.red : Colors.green,
            ),
            SizedBox(width: 5),
            Text(isStartingMonth ? 'Oct 2023' : 'Dec 2023',
                style: kCardTitleTextStyle),
          ],
        ),
      ),
    );
  }
}

// 3.
class PopUpReport extends StatelessWidget {

  const PopUpReport({
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

  SizedBox _buildBodyText(String text, {double? width}) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: reportTextStyle.copyWith(
          fontSize: 11,
          color: Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Column _buildReportBodyWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBodyText('04', width: 40),
              _buildBodyText('0', width: 40),
              _buildBodyText('02:25 PM', width: 55),
              _buildBodyText('-', width: 55),
              _buildBodyText('No Punch-Out', width: 72),
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
    var uiConsumer = Provider.of<AttendanceReportUIProvider>(context);
    return AnimatedOpacity(
      opacity: uiConsumer.isReportPopUpVisible? 1: 0,
      duration: Duration(milliseconds: 400),
      child: Visibility(
        visible: uiConsumer.isReportPopUpVisible,
        child: GestureDetector(
          onTap: (){
            uiConsumer.toggleReportPopUpVisible();
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.black38,
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: (){
                //  GestureDetector makes Popup insensitive to touch
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 170,
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
                        child: Column(
                          // shrinkWrap: true,
                          children: [
                            _buildReportBodyWidget(),
                            _buildReportBodyWidget(),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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

// 4.
