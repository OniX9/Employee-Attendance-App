import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/controller/uiProviders/admin_ui.dart';
import 'package:employee_attendance/screens/subscription_screen.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:employee_attendance/widgets/page_transiton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = Provider.of<AdminUIProvider>(context).isAdmin;
    return Scaffold(
      appBar: MyAppBar(context, label: 'Settings'),
      body: SafeArea(
        child: Column(
          children: [
            SettingsItem(
              label: 'Terms and Privacy Policy',
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[800],
                size: 20,
              ),
            ),
            SettingsItem(
              label: 'Rate Us',
              trailing: Icon(
                Icons.thumb_up_alt_sharp,
                color: Colors.grey[800],
                size: 20,
              ),
            ),
            Visibility(
              visible: isAdmin,
              child: SettingsItem(
                label: 'Subscription Plans',
                trailing: Icon(
                  Icons.credit_card,
                  color: Colors.grey[900],
                  size: 22,
                ),
                onPressed: (){
                  Navigator.of(context).push(PageTransition(
                    SubscriptionScreen(),
                    direction: SlideFrom.right,
                  ));
                },
              ),
            ),
            SettingsItem(
              // TODO: Use proper Icon
            label: 'Query / Feedback',
              trailing: Icon(
                Icons.chat_bubble_outlined,
                color: Colors.grey[800],
                size: 20,
              ),
            ),
            SettingsItem(
              label: 'Share App',
              trailing: Icon(
                Icons.share,
                color: Colors.grey[800],
                size: 20,
              ),
            ),
            SettingsItem(
              // TODO: Use an FAIcon here, rather than SVG
              label: 'Disscusion(Skype)',
              isSkypeItem: true,
              trailing: SvgPicture.asset(
                'assets/images/skype.svg',
                width: 20,
                height: 20,
              ),
            ),
            SettingsItem(
              label: 'Log out',
              trailing: Icon(
                Icons.logout,
                color: Colors.grey[900],
                size: 22,
              ),
            ),
            SettingsItem(
              label: 'Developed by',
              trailing: Text(
                'Gabs Infotech',
                style: kSettingsTextStyle,
              ),
            ),
            SettingsItem(
              label: 'Application Version',
              trailing: Text(
                '7.0',
                style: kSettingsTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String label;
  final Widget trailing;
  final bool isSkypeItem;
  final void Function()? onPressed;

  const SettingsItem({
    required this.label,
    required this.trailing,
    this.isSkypeItem = false,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        width: double.maxFinite,
        height: 45,
        decoration: kDividerBoxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: kSettingsTextStyle,
            ),
            Visibility(
              visible: isSkypeItem,
              child: Text(
                'live:.cid.63b2eaa2397d7299a3',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
