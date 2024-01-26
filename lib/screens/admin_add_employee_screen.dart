import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/auth_text_field.dart';
import 'package:employee_attendance/widgets/blue_tag_container.dart';
import 'package:employee_attendance/widgets/labeled_check_box.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/phone_no_textfield.dart';
import 'package:flutter/material.dart';

class AdminAddEmployeeScreen extends StatelessWidget {
  const AdminAddEmployeeScreen({super.key});

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
            TimeSlotsContainer(),
            PaymentInfoContainer(),
          ],
        ),
      ),
    );
  }
}

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

class TimeSlotWidget extends StatelessWidget {
  final String day;
  final bool isSelected;

  const TimeSlotWidget({
    required this.day,
    this.isSelected = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 70,
          child: Row(
            children: [
              LabeledCheckBox(),
              SizedBox(width: 7),
              Text(
                day,
                style: TextStyle(color: Colors.grey[700]),
                //TODO: change style to kCardTitleTextstyle,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            '10:00 AM',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            '07:00 PM',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            '09:00',
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: LabeledCheckBox(),
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
            PaymentTypeToggle(),
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
          style: kCheckLabelTextStyle,
        ),
        SizedBox(width: 100),
        Row(
          children: [
            SizedBox(
              width: 80,
              height: 20,
              child: TextField(
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  keyboardType: TextInputType.number,
                  decoration: kAuthInputDecoration),
            ),
            SizedBox(height: 100),
            Text(
              isMonthly ? '/Month' : '/Day',
              style: TextStyle(color: Colors.grey[300]),
            ),
          ],
        )
      ],
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

class PaymentTypeToggle extends StatelessWidget {
  const PaymentTypeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Payment Type', style: kCheckLabelTextStyle),
        Flexible(child: SizedBox(width: 60)),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: Add app logic to toggle monthly or daily.
            LabeledCheckCircle(
              value: true,
              label: 'Monthly',
              labelSpacing: 8,
              labelStyle: kCheckLabelTextStyle,
              onPressed: () {},
            ),
            SizedBox(height: 8),
            LabeledCheckCircle(
              value: false,
              label: 'Daily',
              labelSpacing: 8,
              labelStyle: kCheckLabelTextStyle,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}

class LabeledCheckCircle extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final double? labelSpacing;
  final bool value;
  final Color color;
  final void Function()? onPressed;

  const LabeledCheckCircle(
      {this.label = '',
      this.value = true,
      this.labelStyle,
      this.labelSpacing = 5,
      this.color = const Color(0xFF2195F1),
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            // OUTER CIRCLE
            padding: EdgeInsets.all(1.2),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: value ? color : Color(0xFF747474),
              ),
            ),
            child: Visibility(
              visible: value,
              child: Container(
                // INNER CIRCLE
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: labelSpacing),
        Text(label, style: labelStyle),
      ],
    );
  }
}
