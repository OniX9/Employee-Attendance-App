import 'dart:ui';
import 'package:employee_attendance/constants.dart';
import 'package:flutter/material.dart';

class PasswordChangePopUp extends StatelessWidget {
  final bool popUp;
  final void Function(String)? passwordOnChanged;
  final void Function()? saveActionButton;
  final void Function()? cancelActionButton;

  const PasswordChangePopUp({
    super.key,
    required this.popUp,
    required this.passwordOnChanged,
    required this.saveActionButton,
    required this.cancelActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      alignment: Alignment.bottomRight,
      scale: popUp ? 1 : 0.2,
      duration: Duration(milliseconds: 260),
      child: Visibility(
        visible: popUp,
        child: GestureDetector(
          onTap: cancelActionButton,
          child: Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 15),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Ensures the pop up's container isn't sensitive to touch,
                    // it returns nothing.
                  },
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 380),
                    padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    width: 400,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: kPopUpInputDecoration.copyWith(
                              hintText: 'New Password',
                            ),
                            onChanged: passwordOnChanged,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'CANCEL',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                            MaterialButton(
                              onPressed: saveActionButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                'CHANGE',
                                style: TextStyle(color: Colors.pink[300]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
