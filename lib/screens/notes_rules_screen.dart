import 'dart:ui';
import 'dart:math';
import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/dataProviders/public_holidays.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/controller/uiProviders/public_holidays_ui.dart';
import 'package:employee_attendance/models/public_holiday.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesRulesScreen extends StatelessWidget {
  const NotesRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<PublicHolidaysUIProvider>(context);
    var dataConsumer = Provider.of<PublicHolidaysProvider>(context);
    var isAdmin = Provider.of<AdminUIProvider>(context).isAdmin;
    String date = ''; // TODO: MAKE DATE COMPULSORY
    String description = '';

    Color markerColorPicker() {
      List<Color> colors = [
        Colors.yellow,
        Colors.red,
        kPrimaryColorLight,
        Colors.lightGreenAccent,
        Colors.grey,
      ];
      return colors[Random().nextInt(colors.length-1)];
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColorLight,
        onPressed: () {
          uiConsumer.toggleAddHolidaysPopUp();
        },
        child: const Icon(Icons.add, size: 40),
      ),
      appBar: MyAppBar(context, label: 'Notes / Rules'),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              NoteRuleItem(
                timeStamp: '15 JAN 2024 12:12 PM',
                markerColor: markerColorPicker(),
                anouncement: 'Attendance On Public Holiday',
                details:'You are not allowed to mark attendance on public holidays. Check your allocated holidays.',
              ),
              NoteRuleItem(
                timeStamp: '15 JAN 2024 12:12 PM',
                markerColor: markerColorPicker(),
                anouncement: 'Attendance On Public Holiday',
                details:'Application will count particular day as ‘ABSENT‘ if you/employee left working place before completing your allocated half day hours. ',
              ),
            ],
          ),
          BlurBackdropPopUp(
              popUp: uiConsumer.isAddHolidaysPopUpVisible,
              titleOnChanged: (String newDate) {
                date = newDate;
              },
              descriptionOnChanged: (String newDesc) {
                description = newDesc;
              },
              saveActionButton: () {
                uiConsumer.toggleAddHolidaysPopUp();
                // dataConsumer.addPublicHolidays(
                //   PublicHoliday(date: date, description: description),
                // );
              },
              cancelActionButton: () {
                uiConsumer.toggleAddHolidaysPopUp();
              }),
        ],
      ),
    );
  }
}

// ** CUSTOM WIDGETS**
// 1.
class NoteRuleItem extends StatelessWidget {
  final String details;
  final String timeStamp;
  final Color markerColor;
  final String anouncement;

  const NoteRuleItem({
    required this.details,
    required this.timeStamp,
    required this.markerColor,
    required this.anouncement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 5),
      width: double.maxFinite,
      decoration: kDividerBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, right: 8),
                child: CircleAvatar(radius: 6.3, backgroundColor: markerColor),
              ),
              Text(
                anouncement,
                style: kNotesRulesTextStyle,
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: 22),
            width:MediaQuery.of(context).size.width*0.85,
            child: Text(
              details,
              overflow: TextOverflow.visible,
              style: kNotesRulesTextStyle.copyWith(
                fontSize: 16,
                color: const Color(0xFF808284),
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeStamp,
              style: kNotesRulesTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2.
class BlurBackdropPopUp extends StatelessWidget {
  final bool popUp;
  final void Function(String)? titleOnChanged;
  final void Function(String)? descriptionOnChanged;
  final void Function()? saveActionButton;
  final void Function()? cancelActionButton;

  const BlurBackdropPopUp({
    super.key,
    required this.popUp,
    required this.titleOnChanged,
    required this.descriptionOnChanged,
    required this.saveActionButton,
    required this.cancelActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      alignment: Alignment.bottomRight,
      scale: popUp ? 1 : 0.2,
      duration: Duration(milliseconds: 260),
      child: Visibility(
        visible: popUp,
        child: GestureDetector(
          onTap: cancelActionButton,
          child: Container(
            color: Colors.transparent,
            height: double.infinity,
            width: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 15),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Ensures the pop up's container isn't sensitive to touch,
                    // it returns nothing.
                  },
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 380, minHeight: 230),
                    padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    width: 400,
                    height: 240,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'New Note',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), hintText: 'Enter Title'),
                            onChanged: titleOnChanged,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Description',
                          ),
                          onChanged: descriptionOnChanged,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'cancel',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'save',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
