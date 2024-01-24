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

class PublicHolidaysScreen extends StatelessWidget {
  const PublicHolidaysScreen({super.key});

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

    FloatingActionButton? _buildFloatingAddHolidayButtonIfIsAdmin(){
      return isAdmin ? FloatingActionButton(
        backgroundColor: kPrimaryColorLight,
        onPressed: () {
          uiConsumer.toggleAddHolidaysPopUp();
        },
        child: const Icon(Icons.add, size: 40),
      ) : null;
    }

    return Scaffold(
      floatingActionButton: _buildFloatingAddHolidayButtonIfIsAdmin(),
      appBar: MyAppBar(context, label: 'Public Holidays'),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: dataConsumer.publicHolidaysCount,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => PublicHolidayItem(
              markerColor: markerColorPicker(),
              holidayText: dataConsumer.publicHolidays[index].description,
              date: dataConsumer.publicHolidays[index].date,
            ),
          ),
          BlurBackdropPopUp(
              popUp: uiConsumer.isAddHolidaysPopUpVisible,
              dateOnChanged: (String newDate) {
                date = newDate;
              },
              descriptionOnChanged: (String newDesc) {
                description = newDesc;
              },
              saveActionButton: () {
                uiConsumer.toggleAddHolidaysPopUp();
                dataConsumer.addPublicHolidays(
                  PublicHoliday(date: date, description: description),
                );
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
class PublicHolidayItem extends StatelessWidget {
  final String holidayText;
  final Color markerColor;
  final String date;

  const PublicHolidayItem({
    required this.holidayText,
    required this.markerColor,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12, left: 12, bottom: 15),
      width: double.maxFinite,
      height: 70,
      decoration: kDividerBoxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3, right: 8),
            child: CircleAvatar(radius: 6.3, backgroundColor: markerColor),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                holidayText,
                style: kPublicHolidaysTextStyle.copyWith(
                  color: const Color(0xFF808284),
                ),
              ),
              SizedBox(height: 5),
              Text(
                date,
                style: kPublicHolidaysTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BlurBackdropPopUp extends StatelessWidget {
  final bool popUp;
  final void Function(String)? dateOnChanged;
  final void Function(String)? descriptionOnChanged;
  final void Function()? saveActionButton;
  final void Function()? cancelActionButton;

  const BlurBackdropPopUp({
    super.key,
    required this.popUp,
    required this.dateOnChanged,
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
                          'New Holiday',
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
                                border: OutlineInputBorder(), hintText: 'date'),
                            onChanged: dateOnChanged,
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
                              onPressed: cancelActionButton,
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
