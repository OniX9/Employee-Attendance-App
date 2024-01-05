import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/auth_text_field.dart';
import 'package:employee_attendance/widgets/clipped_container.dart';
import 'package:employee_attendance/widgets/finger_icon_and_auth_check_button.dart';
import 'package:employee_attendance/widgets/forgot_password_button.dart';
import 'package:employee_attendance/screens/admin_create_account.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../controller/uiProviders/admin_ui.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

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
                          'ACCOUNT VERIFICATION',
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
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015),
                                          child: Image.asset(
                                              'assets/images/login/acount_verification_logo.png'),
                                        ),
                                        const Text(
                                          'Welcome',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Sign-up to Proceed',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    AdminEmployeeToggle(),
                                    AuthTextField(AuthType.email),
                                    AuthTextField(AuthType.password),
                                    ForgotPasswordButton(),
                                    FingerIconAndAuthCheckButton(),
                                    Expanded(child: SizedBox()),
                                  ],
                                ),
                              ),
                            ),
                            //2. Bottom Clipped Container
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClippedContainer(
                                clipPosition: Cut.top,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Don't have Admin account yet?",
                                      style: kAuthTextStyle.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Make ',
                                        style: kAuthTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'free',
                                            style: kAuthTextStyle.copyWith(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' account',
                                            style: kAuthTextStyle.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CreateAccountButton(
                                      id: 'Create Account',
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context){
                                            return AdminAcountCreate();
                                          },
                                          ),
                                        );
                                      },
                                    ),
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

class CreateAccountButton extends StatelessWidget {
  final String id;
  final void Function()? onPressed;

  const CreateAccountButton({
    required this.id,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 40,
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'CREATE ACCOUNT',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ***CUSTOM WIDGET***

// 1. Admin & Employee Blue-White Toggle Switch
// & Switch's blue thumb.
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
      height: 40,
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
      duration: const Duration(milliseconds: 195),
      child: Container(
        width: width,
        color: kPrimaryColor,
      ),
    );
  }
}
