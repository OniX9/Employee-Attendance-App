import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/screens/login_signup_screen.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:rive/rive.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: OnBoardingSlider(
            headerBackgroundColor: Colors.white,
            // indicatorPosition: 0,
            finishButtonText: 'Start',
            centerBackground: true,
            finishButtonStyle: FinishButtonStyle(
              backgroundColor: kPrimaryColor,
            ),
            skipTextButton: Text('Skip'),
            // trailing: Text('Login'),
            onFinish: (){
              Navigator.of(context).push(PageTransition(LoginSignUpScreen()));
            },
            background: [
              OnBoardingPage_A(),
              OnBoardingPage_B(),
              OnBoardingPage_C(),
              OnBoardingPage_D(),
              OnBoardingPage_E(),
            ],
            totalPage: 5,
            speed: 4,
            pageBodies: const [
              OnBoardingPageDescription('Add your employees & their time slots and more.'),
              OnBoardingPageDescription('Employee have to mark their attendance with simple tap when they come at or left work place'),
              OnBoardingPageDescription('Check month wise attendance records. You can also export the attendance records and share it'),
              OnBoardingPageDescription('Admin get notification when any selected employees mark their attendance and also send their mobile phone mapping requests.'),
              OnBoardingPageDescription('App reminds employees regarding Punch Out.'),
            ],
          ),
        ),
      ),
    );
  }
}

// ***CUSTOM WIDGETS***

// 1. Onboarding Backgrounds.

class OnBoardingPage_A extends StatelessWidget {
  const OnBoardingPage_A({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.48,
          child: const RiveAnimation.asset(
            'assets/riv_animations/onbording_employee-animation.riv',
          ),
        ),
        OnBoardingPageTitle('EMPLOYEE'),
      ],
    );
  }
}



class OnBoardingPage_B extends StatelessWidget {
  const OnBoardingPage_B({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
            child: SvgPicture.asset('assets/images/onboarding_mark_attendance.svg'),
        ),
        const OnBoardingPageTitle('MARK ATTENDANCE'),
      ],
    );
  }
}


class OnBoardingPage_C extends StatelessWidget {
  const OnBoardingPage_C({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: SvgPicture.asset('assets/images/onboarding_attendance_report.svg'),
        ),
        const OnBoardingPageTitle('ATTENDANCE REPORT AND SALARY CALCULATION'),
      ],
    );
  }
}

class OnBoardingPage_D extends StatelessWidget {
  const OnBoardingPage_D({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: SvgPicture.asset('assets/images/onboarding_notification.svg'),
        ),
        const OnBoardingPageTitle('NOTIFICATION'),
      ],
    );
  }
}

class OnBoardingPage_E extends StatefulWidget {

  const OnBoardingPage_E({
    super.key,
  });

  @override
  State<OnBoardingPage_E> createState() => _OnBoardingPage_EState();
}

class _OnBoardingPage_EState extends State<OnBoardingPage_E> {
  late RiveAnimationController _controller;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _controller.isActive = true;
  }

  void initState() {
    super.initState();
    _controller = OneShotAnimation(
        'bell',
      autoplay: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.48,
          child: RiveAnimation.asset(
            'assets/riv_animations/onboarding_reminder.riv',
            controllers: [_controller],
          ),
        ),
        OnBoardingPageTitle('REMINDER'),
      ],
    );
  }
}

// 2. Onboarding Title.

class OnBoardingPageTitle extends StatelessWidget {
  final String text;
  const OnBoardingPageTitle(this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

// 3. Onboarding Bottom Text Description.

class OnBoardingPageDescription extends StatelessWidget {
  final String text;
  const OnBoardingPageDescription(this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 470,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}