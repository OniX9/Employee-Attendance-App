import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/menu_button.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class ViewEmployeeScreen extends StatelessWidget {
  const ViewEmployeeScreen({super.key});

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
          EmployeeContainer(
            name: 'OLA JAMES',
            mobileNo: 2341234567890,
          ),
          EmployeeContainer(
            name: 'BRIGHT',
            mobileNo: 2342382839302,
          ),
        ],
      ),
    );
  }
}

class EmployeeContainer extends StatelessWidget {
  final String name;
  final int mobileNo;

  const EmployeeContainer({
    required this.name,
    required this.mobileNo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
            MenuButton(
              color: Colors.grey,
              onPressed: () {
                //TODO: Add a pop menu,
              }
            ),
          ),
        ],
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
