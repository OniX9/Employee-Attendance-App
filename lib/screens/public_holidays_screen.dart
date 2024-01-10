import 'dart:ui';

import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/controller/uiProviders/public_holidays_ui.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicHolidaysScreen extends StatelessWidget {
  const PublicHolidaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<PublicHolidaysUIProvider>(context);
    var isAdmin = Provider.of<AdminUIProvider>(context).isAdmin;
    var PublicHolidayWidgets = <PublicHolidayItem>[
      PublicHolidayItem(
        markerColor: kPrimaryColorLight,
        holidayText: 'New year',
        date: '1 Jan 2024',
      ),
      PublicHolidayItem(
        markerColor: Colors.red,
        holidayText: 'Meet & mingle',
        date: '9 Feb 2024',
      ),
      PublicHolidayItem(
        markerColor: Colors.yellow,
        holidayText: 'Ted talk',
        date: '18 March 2024',
      ),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColorLight,
        onPressed: (){
          uiConsumer.toggleAddHolidaysPopUp();
        },
        child: Icon(Icons.add, size: 40),
      ),
        appBar: MyAppBar(context, label: 'Public Holidays'),
        body: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: PublicHolidayWidgets,
            ),
            BlurBackdropPopUp(
                popUp: uiConsumer.isAddHolidaysPopUpVisible,
                saveActionButton: (){
                  uiConsumer.toggleAddHolidaysPopUp();
                },
                cancelActionButton: (){
                  uiConsumer.toggleAddHolidaysPopUp();
                }
            ),
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
            child: CircleAvatar(
                radius: 6.3, backgroundColor: markerColor),
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
  final void Function()? saveActionButton;
  final void Function()? cancelActionButton;

  const BlurBackdropPopUp({
    super.key,
    required this.popUp,
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
                        Text('New Holiday',
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
                              border: OutlineInputBorder(),
                              hintText: 'date'
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Description',
                            ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: Text('cancel',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: Text('save',
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
