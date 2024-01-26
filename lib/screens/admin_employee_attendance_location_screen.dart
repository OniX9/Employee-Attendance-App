import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';

class AdminEmployeeAttendanceLocationScreen extends StatelessWidget {
  final String workerId;

  const AdminEmployeeAttendanceLocationScreen(this.workerId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          GoogleMapWidget(
            zoomControlsEnabled: true,
            currentLocationMarkerOnly: true,
            currentLocation: CurrentLocation(lat: 4.8472226, long: 6.974604),
          ),
          SafeArea(
            child: CallEmployeeFloatingAppBar(workerId: workerId),
          ),
          // FloatingZoomMapButton(),
        ],
      ),
    );
  }
}


//**CUSTOM WIDGETS**
// 1.
class CallEmployeeFloatingAppBar extends StatelessWidget {
  const CallEmployeeFloatingAppBar({
    super.key,
    required this.workerId,
  });

  final String workerId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 32,
            ),
          ),
          Text(workerId,
              style: kCardTitleTextStyle.copyWith(
                color: Colors.black,
              )),
          Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.phone,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

// 2.
