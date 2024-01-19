import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/call_action_button.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/labeled_check_box.dart';
import 'package:employee_attendance/widgets/menu_button.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

//ADMIN
class SalaryAmountCalculationScreen extends StatelessWidget {
  const SalaryAmountCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      appBar: MyAppBar(
        context,
        label: 'Amount Calculation',
        trailing: MenuButton(onPressed: () {}),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CalculatedDetailsContainer(),
          SendSalarySlipButton(),
        ],
      ),
    );
  }
}

// **CUSTOM WIDGETS**
//1.
class CalculatedDetailsContainer extends StatelessWidget {
  const CalculatedDetailsContainer({
    super.key,
  });

  Widget buildTitleDescriptionA(
      {required String title, required String description}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kCardDescriptionTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              description,
              style: kCardTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildTitleDescriptionB({
    required String title,
    required String description,
    bool isCheckBoxVisible = false,
    bool isInfoIconVisible = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: isCheckBoxVisible,
                child: LabeledCheckBox(
                  textSpacing: 10,
                  padding: 15,
                ),
              ),
              SizedBox(
                width: isCheckBoxVisible ? 160 : 185,
                child: Text(
                  title,
                  style: kCheckLabelTextStyle.copyWith(
                    color: kPrimaryColorLight,
                    // fontSize: 14,
                  ),
                ),
              ),
              Text(
                description,
                style: kCardTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              Expanded(child: SizedBox()),
              Visibility(
                visible: isInfoIconVisible,
                child: Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.only(right: 5, bottom: 3),
                  alignment: Alignment.center,
                  child: Icon(Icons.info_outline, color: Colors.black12),
                ),
              ),
            ],
          ),
        ),
        Container(width: double.maxFinite, height: 1, color: Colors.black12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 462,
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(blurRadius: 3, color: Colors.black12, offset: Offset(3, 3))
        ],
      ),
      child: Column(
        children: [
          buildTitleDescriptionA(
            title: 'Name',
            description: 'JAMES',
          ),
          buildTitleDescriptionA(
            title: 'Mobile No',
            description: '1234567890',
          ),
          buildTitleDescriptionA(
            title: 'Payment Type',
            description: 'Month Wise',
          ),
          buildTitleDescriptionA(
            title: 'Decided Amount',
            description: '₦50000',
          ),
          buildTitleDescriptionA(
            title: 'Total Days In Month',
            description: '31',
          ),
          buildTitleDescriptionA(
            title: 'Total Attended Days',
            description: '25',
          ),
          buildTitleDescriptionA(
            title: 'Total Actual Working Days',
            description: '25.0',
          ),
          Container(
            width: double.maxFinite,
            height: 2,
            color: Colors.black12,
          ),
          _buildTitleDescriptionB(
            title: 'Total Present Days',
            description: '25.0',
          ),
          _buildTitleDescriptionB(
            title: 'Total Half Days',
            description: '0.0',
          ),
          _buildTitleDescriptionB(
            title: 'Total Absent Days',
            description: '2.0',
            isInfoIconVisible: true,
          ),
          _buildTitleDescriptionB(
            title: 'Pay Public Holidays',
            description: '0.0',
            isCheckBoxVisible: true,
          ),
          _buildTitleDescriptionB(
            title: 'Pay Non Working Days',
            description: '0.0',
            isCheckBoxVisible: true,
          ),
          _buildTitleDescriptionB(
            title: 'Total Paid Days',
            description: '0.0',
            isInfoIconVisible: true,
          ),
          _buildTitleDescriptionB(
            title: 'Amount Per Day',
            description: '₦1612.90',
            isInfoIconVisible: true,
          ),
          _buildTitleDescriptionB(
            title: 'Total Amount To Pay',
            description: '₦40322.5',
            isInfoIconVisible: true,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 8, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 177,
                  child: Text(
                    'Total Over Time (Hours)',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  '00:00',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Not able to calculate amount for this over time hours. You manually have to count salary for this hours.',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// 2.
class SendSalarySlipButton extends StatelessWidget {
  const SendSalarySlipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 3),
            height: 2,
            width: double.maxFinite,
            color: kPrimaryColorLight,
          ),
          CallActionButton(
            margin: EdgeInsets.only(bottom: 3),
            width: 270,
            label: 'SEND SALARY SLIP',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
