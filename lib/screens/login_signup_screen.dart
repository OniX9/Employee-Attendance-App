import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/clipped_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../controller/uiProviders/admin_ui.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5F2F3),
      body: Stack(
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
                      'ACCOUNT VERIFICATION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: ClippedContainer(
                            clipPosition: Cut.bottom,
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: Column(
                              children: [
                                const Text(
                                  'Welcome',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Sign-up to Proceed',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 15),
                                AdminEmployeeToggle()
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ClippedContainer(
                            clipPosition: Cut.top,
                            height: MediaQuery.of(context).size.height * 0.20,
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
    );
  }
}

class AdminEmployeeToggle extends StatelessWidget {
  const AdminEmployeeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AdminUIProvider uiConsumer = Provider.of<AdminUIProvider>(context);
    double fullToggleWidth = MediaQuery.of(context).size.width * 0.76;
    double toggleThumbWidth = MediaQuery.of(context).size.width * 0.38;
    return Container(
      width: fullToggleWidth,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: kPrimaryColor,
          width: 1.2,
        ),
      ),
      child: Stack(
        children: [
          AnimatedToggleThumb(
            width: toggleThumbWidth,
          ),
          Row(
            children: [
              Expanded(
                child: RawMaterialButton(
                  onPressed: () => uiConsumer.isAdmin = true,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      color: uiConsumer.isAdmin == true
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () => uiConsumer.isAdmin = false,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Employee',
                    style: TextStyle(
                      color: uiConsumer.isAdmin == false
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedToggleThumb extends StatelessWidget {
  const AnimatedToggleThumb({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    var uiConsumer = Provider.of<AdminUIProvider>(context);
    return AnimatedAlign(
      alignment:
          uiConsumer.isAdmin ? Alignment.centerLeft : Alignment.centerRight,
      duration: const Duration(milliseconds: 190),
      child: Container(
        width: width,
        color: kPrimaryColor,
      ),
    );
  }
}
