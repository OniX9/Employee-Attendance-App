import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/services/brain.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminAttendanceReportBScreen extends StatelessWidget {
  final String workersID;
  const AdminAttendanceReportBScreen(this.workersID, {super.key});

  @override
  Widget build(BuildContext context) {
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
                MonthFromToButton(),
                SizedBox(width: 23),
                MonthFromToButton(
                  isStartingMonth: false,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: kPrimaryColorLight,
                height: 45,
                minWidth: double.maxFinite,
                child: Text(
                  'Show Report',
                  style: kCardTitleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
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

    return DraggableBottomSheet(
      minExtent: bottomSheetMinExtent,
      useSafeArea: false,
      curve: Curves.easeIn,
      previewWidget: _previewWidget(),
      expandedWidget: _expandedWidget(),
      backgroundWidget: _backgroundWidget(),
      maxExtent: 390,
      onDragging: (pos) {},
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
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          _buildHeadingText('No Punch...', color: Colors.green, width: 75),
          _buildHeadingText('Present Day', color: Colors.blue[600], width: 73),
          _buildHeadingText('Half Day', color: Colors.cyan, width: 55),
          _buildHeadingText('Present But...', color: Colors.red, width: 90),
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
                  color: Colors.green[600],
                  width: 73,
                ),
                _buildHeadingText(
                  presentDay.toString(),
                  color: Colors.green[600],
                  width: 73,
                ),
                _buildHeadingText(
                  halfDay.toString(),
                  color: Colors.cyan,
                  width: 55,
                ),
                _buildHeadingText(
                  presentButAbsent.toString(),
                  color: Colors.red,
                  width: 90,
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

  const MonthFromToButton({
    this.isStartingMonth = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
