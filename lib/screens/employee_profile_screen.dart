import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/auth_text_field.dart';
import 'package:employee_attendance/widgets/blue_tag_container.dart';
import 'package:employee_attendance/widgets/labeled_check_box.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/phone_no_textfield.dart';
import 'package:flutter/material.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context,
        label: 'Profile',
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
            TimeSlotsContainer(),
            PaymentInfoContainer(),
          ],
        ),
      ),
    );
  }
}

// 2.
class TimeSlotsContainer extends StatelessWidget {
  const TimeSlotsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlueTagContainer(
      title: 'Time Slots',
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.only(left: 12),
            height: 55,
            color: Colors.cyan[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeSlotsTableHeading('Working Day', width: 70),
                TimeSlotsTableHeading('From'),
                TimeSlotsTableHeading('To'),
                TimeSlotsTableHeading('Full Day Hours'),
                TimeSlotsTableHeading('Allow Half Day?'),
                TimeSlotsTableHeading('Half Day Hours'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, bottom: 15),
            child: Column(
              children: [
// TODO: App Logic decrs Opacity & reset settings, when first checkbox is false.
                TimeSlotWidget(day: 'MON'),
                TimeSlotWidget(day: 'TUE'),
                TimeSlotWidget(day: 'WED'),
                TimeSlotWidget(day: 'THU'),
                TimeSlotWidget(day: 'FRI'),
                TimeSlotWidget(day: 'SAT'),
                TimeSlotWidget(day: 'SUN'),
                SizedBox(height: 10),
                Text(
                  'Application will start misbehaving if you change already set working hours. You can change working hours only if employee has not any attendance yet.',
                  style: kCardDescriptionTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimeSlotWidget extends StatefulWidget {
  final String day;
  final bool isSelected;

  const TimeSlotWidget({
    required this.day,
    this.isSelected = true,
    super.key,
  });

  @override
  State<TimeSlotWidget> createState() => _TimeSlotWidgetState();
}

class _TimeSlotWidgetState extends State<TimeSlotWidget> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlueWeekDayButton(
          value: isSelected,
          day: widget.day,
          onChanged: () {
            setState(() => isSelected = !isSelected);
          },
        ),
        SizedBox(
          width: 50,
          child: Text(
            isSelected ? '10:00 AM' : 'SET',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            isSelected ? '07:00 PM' : 'SET',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            isSelected ? '09:00' : '00:00',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Opacity(
          opacity: isSelected ? 1 : 0.2,
          child: SizedBox(
            width: 50,
            child: LabeledCheckBox(),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            'SET',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class BlueWeekDayButton extends StatelessWidget {
  final bool value;
  final void Function() onChanged;

  const BlueWeekDayButton({
    required this.onChanged,
    required this.value,
    required this.day,
    super.key,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        //NOTE: Total Container width is 70 add the padding width
        width: 50,
        height: 25,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 20, top: 5),
        decoration: value
            ? BoxDecoration(
                color: kPrimaryColorLight,
                borderRadius: BorderRadius.circular(3),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(width: 2, color: Colors.black12)),
        child: Text(
          day,
          style: TextStyle(color: value ? Colors.grey[200] : Colors.black87),
        ),
      ),
    );
  }
}

class TimeSlotsTableHeading extends StatelessWidget {
  final String text;
  final double? width;

  const TimeSlotsTableHeading(
    this.text, {
    this.width = 50,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(right: 15),
      alignment: Alignment.center,
      child: Text(
        text,
        style: kCardDescriptionTextStyle.copyWith(
            color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
    );
  }
}

// 3.
class PaymentInfoContainer extends StatelessWidget {
  const PaymentInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlueTagContainer(
      title: 'Payment Info',
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          children: [
            PaymentTypeTexts(),
            AmountLabelTextField(
              //TODO: MAKE IS MONTHLY TRUE OR FALSE,
              isMonthly: true,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentTypeTexts extends StatelessWidget {
  const PaymentTypeTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Payment Type',
            style: kCheckLabelTextStyle.copyWith(
              color: Colors.grey[700],
            )),
        Flexible(child: SizedBox(width: 60)),
        Text('Monthly Wise',
            style: kCheckLabelTextStyle.copyWith(
              color: kPrimaryColorLight,
            )),
      ],
    );
  }
}

class AmountLabelTextField extends StatelessWidget {
  final bool isMonthly;

  const AmountLabelTextField({
    required this.isMonthly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Amount',
          style: kCheckLabelTextStyle.copyWith(
            color: Colors.grey[700],
          ),
        ),
        SizedBox(width: 100),
        Row(
          children: [
            Text(
              '₦',
              style: TextStyle(color: Colors.grey[800], fontSize: 14),
            ),
            SizedBox(height: 100),
            Text(
              isMonthly ? '50000 / Month' : '50000 / Day',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        )
      ],
    );
  }
}

// **CUSTOM WIDGETS**
// 1.
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
            EmployeeDetailsTextField(
              title: 'Employee Name',
              details: 'Ola James',
            ),
            EmployeeDetailsTextField(
              title: 'Employee Address',
              details: '123, street, city, state',
            ),
            EmployeeDetailsTextField(
              title: 'Date Of Birth',
              details: '15 JAN 1990',
            ),
            EmployeeDetailsTextField(
              title: 'Mobile No',
              details: '1234567890',
            ),
            EmployeeDetailsTextField(
              title: 'Email Id',
              details: 'olajames@example.com',
            ),
            EmployeeDetailsTextField(
              title: 'Password',
              details: '!james123#',
            ),
            EmployeeDetailsTextField(
              title: 'Designation ( Exe, Employee, Manager',
              details: 'Employee',
            ),
            EmployeeDetailsTextField(
              title: 'Currency Symbo',
              details: '₦',
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeDetailsTextField extends StatelessWidget {
  final String title;
  final String details;
  const EmployeeDetailsTextField({
    required this.title,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: kCardDescriptionTextStyle),
          SizedBox(height: 8),
          SelectableText(details,
              style: kAuthTextStyle.copyWith(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              )),
          SizedBox(height: 3),
          Container(
            //Divider
            width: double.maxFinite,
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
