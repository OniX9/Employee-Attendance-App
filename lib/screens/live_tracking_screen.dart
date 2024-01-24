import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/admin_employee_attendance_location_screen.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:employee_attendance/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class LiveTrackingScreen extends StatelessWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context,
        label: 'Employees',
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 32),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          LiveTrackEmployeeContainer(
            name: 'OLA JAMES',
            mobileNo: 2341234567890,
          ),
          LiveTrackEmployeeContainer(
            name: 'BRIGHT',
            mobileNo: 2342382839302,
          ),
        ],
      ),
    );
  }
}

class LiveTrackEmployeeContainer extends StatelessWidget {
  final String name;
  final int mobileNo;

  const LiveTrackEmployeeContainer({
    required this.name,
    required this.mobileNo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(AdminEmployeeAttendanceLocationScreen(name),
              direction: SlideFrom.right),
        );
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        decoration: kDividerBoxDecoration,
        child: Row(
          children: [
            ProfilePicture(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kCardTitleTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.blueAccent[700],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '+$mobileNo',
                  style: kCardTitleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LiveTrackingSwitch(),
                Text(
                  'Start',
                  style: kCardTitleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.arrow_forward_ios,
                  color: Colors.black87, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveTrackingSwitch extends StatefulWidget {
  LiveTrackingSwitch({
    super.key,
  });

  @override
  State<LiveTrackingSwitch> createState() => _LiveTrackingSwitchState();
}

class _LiveTrackingSwitchState extends State<LiveTrackingSwitch> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 35,
      child: Switch(
        activeColor: kPrimaryColorLight,
        value: value,
        onChanged: (newValue) => setState(
          () {
            value = newValue;
          },
        ),
      ),
    );
  }
}
