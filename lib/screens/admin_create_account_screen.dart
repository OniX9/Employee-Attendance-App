import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/auth_text_field.dart';
import 'package:employee_attendance/widgets/clipped_container.dart';
import 'package:employee_attendance/widgets/finger_icon_and_auth_check_button.dart';
import 'package:flutter/material.dart';

class AdminAcountCreateScreen extends StatelessWidget {
  const AdminAcountCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F2F3),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/login/background.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.375,
                fit: BoxFit.fill,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 210),
                        child: Text(
                          'ADMIN ACCOUNT CREATE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: Stack(
                          children: [
                            //1. Top Clipped Container
                            Align(
                              alignment: Alignment.topCenter,
                              child: ClippedContainer(
                                clipPosition: Cut.bottom,
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: Image.asset(
                                          'assets/images/login/acount_verification_logo.png'),
                                    ),
                                    SizedBox(height: 15),
                                    AuthTextField(AuthType.name),
                                    AuthTextField(AuthType.phoneNumber),
                                    AuthTextField(AuthType.email),
                                    AuthTextField(AuthType.password),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          left: 30, top: 10),
                                      child: Text(
                                        'Add your Fingerprint',
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    FingerIconAndAuthCheckButton(),
                                    Expanded(child: SizedBox()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
