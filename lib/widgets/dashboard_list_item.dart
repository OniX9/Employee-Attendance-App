import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class DashBoardListItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final void Function()? onPressed;

  const DashBoardListItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomCard(
        margin: EdgeInsets.only(top: 12, right: 20, left: 20),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.black12,
                  width: 1.2,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
                radius: 45,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: Text(description, style: kCardDescriptionTextStyle),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}