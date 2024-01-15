import 'package:employee_attendance/widgets/blue_container_tag.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class BlueTagContainer extends StatelessWidget {
  //TODO: Transfer to widget dir.
  final Widget child;
  final double? height;
  final String title;
  final bool showProfilePic;
  final EdgeInsetsGeometry? margin;

  const BlueTagContainer({
    required this.title,
    this.child = const SizedBox(),
    this.height,
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.showProfilePic = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.maxFinite,
      height: height,
      margin: margin,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: showProfilePic ? 0 : 12),
                child: BlueTag(
                  title: title,
                ),
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
