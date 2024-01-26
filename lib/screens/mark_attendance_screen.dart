import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/uiProviders/mark_attendance_ui.dart';
import 'package:employee_attendance/widgets/clickable_text.dart';
import 'package:employee_attendance/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/my_appbar.dart';

class MarkAttendanceScreen extends StatelessWidget {
  const MarkAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double fingerprintIconRadius = 28;
    var uiConsumer = Provider.of<MarkAttendanceUIProvider>(context);
    return Scaffold(
      appBar: MyAppBar(
        context,
        label: 'Mark Attendance',
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.info, size: 30),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GoogleMapWidget(
                  compassEnabled: true,
                  myLocationButtonEnabled: true,
                  currentLocation: CurrentLocation(lat: 4.8472226, long: 6.974604),
                ),
              ),
              BottomTimeLocationContainer(
                fingerprintIconRadius: 28,
              ),
            ],
          ),
          Positioned(
            // bottom's value is BottomTimeLocationContainer()'s height - fingerprintIconRadius
            bottom: 252,
            right:
                MediaQuery.of(context).size.width * 0.5 - fingerprintIconRadius,
            child: GestureDetector(
              onTap: () {
                uiConsumer.togglePopUp();
              },
              child: CircleAvatar(
                radius: fingerprintIconRadius,
                child:
                    Icon(Icons.fingerprint, size: 50), //TODO: ADD Proper Icon
                // backgroundImage: ,
              ),
            ),
          ),
          Positioned(
              // bottom's value is BottomTimeLocationContainer()'s height - fingerprintIconRadius
              bottom: 255,
              child: MaterialButton(
                onPressed: () {},
                color: kPrimaryColorLight,
                shape: CircleBorder(),
                child: Icon(Icons.refresh, color: Colors.grey[200], size: 25),
              )),
          ConfirmationPopUp(
            saveActionButton: () {
              uiConsumer.togglePopUp();
            },
            cancelActionButton: () {
              uiConsumer.togglePopUp();
            },
          ),
        ],
      ),
    );
  }
}

//**CUSTOM WIDGET**
// 1.
class BottomTimeLocationContainer extends StatelessWidget {
  final double fingerprintIconRadius;

  const BottomTimeLocationContainer({
    required this.fingerprintIconRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: 280,
      color: Color(0xFF000232),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: fingerprintIconRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Punch In Now',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.grey[200],
              )),
          SizedBox(height: 3),
          Text(
            '06:28 PM',
            style: kCardTitleTextStyle.copyWith(
              fontSize: 14,
              color: Colors.grey[300],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '29.992001 meters accurate',
            style: kCardTitleTextStyle.copyWith(
              fontSize: 14,
              color: Color(0xFF8C8704),
              fontWeight: FontWeight.w400,
            ),
          ),
          blueDivider(),
          Container(
            padding: EdgeInsets.only(
              top: 2,
            ),
            width: double.maxFinite,
            height: 42,
            child: Stack(
              children: [
                Text(
                  'Today',
                  style: kCardTitleTextStyle.copyWith(
                    fontSize: 14,
                    color: kPrimaryColorLight,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '17 Jan 2024',
                    style: kCardTitleTextStyle.copyWith(
                      fontSize: 14,
                      color: kPrimaryColorLight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'IN TIME Yet to come',
                    style: kCardTitleTextStyle.copyWith(
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'OUT TIME Yet to leave',
                    style: kCardTitleTextStyle.copyWith(
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          blueDivider(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Current Location',
              style: kCardTitleTextStyle.copyWith(
                color: kPrimaryColorLight,
              ),
            ),
          ),
          CurrentLocationContainer(),
        ],
      ),
    );
  }
}

class CurrentLocationContainer extends StatelessWidget {
  const CurrentLocationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(Icons.gps_fixed, size: 30, color: Colors.white),
          SizedBox(width: 3),
          buildLatLongTextRow('Latitude', 'Longitude'),
          SizedBox(width: 35),
          buildLatLongTextRow('21.233354', '72.864070'),
        ],
      ),
    );
  }

  Column buildLatLongTextRow(String topText, String bottomText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: kCardTitleTextStyle.copyWith(
            fontSize: 14,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 3),
        Text(
          bottomText,
          style: kCardTitleTextStyle.copyWith(
            fontSize: 14,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}

class blueDivider extends StatelessWidget {
  const blueDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 6),
      color: Colors.blue[200],
    );
  }
}

// 3.
class ConfirmationPopUp extends StatelessWidget {
  final void Function()? saveActionButton;
  final void Function()? cancelActionButton;

  const ConfirmationPopUp({
    required this.saveActionButton,
    required this.cancelActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<MarkAttendanceUIProvider>(context);
    final TextStyle popUpTextStyle = TextStyle(
      fontSize: 17,
      color: Colors.grey[800],
      fontWeight: FontWeight.w500,
    );
    final TextStyle boldPopUpTextStyle = TextStyle(
      fontSize: 18,
      color: Colors.grey[900],
      fontWeight: FontWeight.w500,
    );
    return AnimatedOpacity(
      opacity: uiConsumer.isPopUpVisible ? 1 : 0,
      duration: Duration(milliseconds: 400),
      child: Visibility(
        visible: uiConsumer.isPopUpVisible,
        child: GestureDetector(
          onTap: () {
            uiConsumer.togglePopUp();
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Punch In',
                        style: boldPopUpTextStyle,
                      ),
                      SizedBox(height: 15),
                      RichText(
                        text: TextSpan(
                          text: "‘06:28 PM‘",
                          style: boldPopUpTextStyle,
                          children: [
                            TextSpan(
                              text: ' is consider as your',
                              style: popUpTextStyle,
                            ),
                            TextSpan(
                              text: " ‘IN’",
                              style: boldPopUpTextStyle,
                            ),
                            TextSpan(
                              text: ' time',
                              style: popUpTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Are you sure to do Punch In?',
                        style: popUpTextStyle,
                      ),
                      Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 30,
                            child: MaterialButton(
                              onPressed: cancelActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: kPrimaryColorLight,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  color: kPrimaryColorLight,
                                  fontSize: 17,
                                ),
                              ),
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
    );
  }
}
