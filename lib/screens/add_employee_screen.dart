import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/admin_dashboard_screen.dart';
import 'package:employee_attendance/widgets/auth_text_field.dart';
import 'package:employee_attendance/widgets/blue_container_tag.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/phone_no_textfield.dart';
import 'package:employee_attendance/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context,
        label: 'Add Employee',
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.check_rounded),
        ),
      ),
      backgroundColor: kBlueScaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            EmployeeInformationContainer(),
            BlueTagContainer(title: 'Time Slots'),
            BlueTagContainer(
              title: 'Payment Info',
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Payment Type'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Amount'),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextField(
                            ),
                          ),
                          Text('/Month'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// **CUSTOM WIDGETS**
class EmployeeInformationContainer extends StatelessWidget {
  const EmployeeInformationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlueTagContainer(
      title: 'Employee information',
      showProfilePic: true,
      height: null,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTextField(
              AuthType.employeeName,
              hidePrefixIcon: true,
            ),
            AuthTextField(
              AuthType.employeeAddress,
              hidePrefixIcon: true,
            ),
            AuthTextField(
              AuthType.dateOfBirth,
              hidePrefixIcon: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PhoneNoTextField(
                disableLengthCheck: true,
              ),
            ),
            AuthTextField(
              AuthType.email,
              hidePrefixIcon: true,
            ),
            AuthTextField(
              AuthType.password,
              hidePrefixIcon: true,
              showObscureText: true,
            ),
            AuthTextField(
              AuthType.designation,
              hidePrefixIcon: true,
            ),
            AuthTextField(
              AuthType.currency,
              hidePrefixIcon: true,
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                'Notify me when this Employee Do Punch In/Out',
                style: kCardDescriptionTextStyle,
              ),
            ),
            Row(
              children: [
                LabeledCheckBox(
                  label: 'Punch In',
                ),
                SizedBox(width: 60),
                LabeledCheckBox(
                  label: 'Punch Out',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LabeledCheckBox extends StatefulWidget {
  final String label;

  const LabeledCheckBox({
    this.label = '',
    super.key,
  });

  @override
  State<LabeledCheckBox> createState() => _LabeledCheckBoxState();
}

class _LabeledCheckBoxState extends State<LabeledCheckBox> {
  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (newValue) => setState(
            () {
              isChecked = newValue;
            },
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        Text(widget.label),
      ],
    );
  }
}

class BlueTagContainer extends StatelessWidget {
  //TODO: Transfer to widget dir.
  final Widget child;
  final double? height;
  final String title;
  final bool showProfilePic;

  const BlueTagContainer({
    required this.title,
    this.child = const SizedBox(),
    this.height,
    this.showProfilePic = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.maxFinite,
      height: height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlueTag(
                title: title,
              ),
              Visibility(
                visible: showProfilePic,
                child: Padding(
                  padding: const EdgeInsets.only(right: 13, top: 13),
                  child: ProfilePicture(
                    radius: 35,
                  ),
                ),
              )
            ],
          ),
          child
        ],
      ),
    );
  }
}
