import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/screens/employee_dashboard_screen.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// Fingerprint Icon and Signin and Signup Button

class FingerIconAndAuthCheckButton extends StatelessWidget {
  const FingerIconAndAuthCheckButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AdminUIProvider uiConsumer = Provider.of<AdminUIProvider>(context);
    return Container(
      // TODO: Fix fingerprint Icon clipping.
      alignment: Alignment.topCenter,
      height: 80,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/login/fingerprint-check.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // CircularProgressIndicator();
                  if (uiConsumer.isAdmin == false) {
                    Navigator.of(context).push(
                      PageTransition(EmployeeDashboardScreen(),
                          direction: Slide.top),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColorLight,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
