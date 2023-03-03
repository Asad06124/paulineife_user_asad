import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text(
            'Settings',
            style: getAppbarTextTheme(),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            getSettingsTile(
                leading: Icon(
                  Icons.chat_bubble_outline,
                ),
                title: "FAQ & Contact Support",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                ),
                title: "About Us",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.view_list_sharp,
                ),
                title: "Terms & Conditions",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.chat_bubble_outline,
                ),
                title: "Privacy Policy",
                trailing: Icon(
                  Icons.privacy_tip,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            // getSettingsTile(
            //     leading: Icon(
            //       Icons.mode_night,
            //     ),
            //     title: "Dark Mode",
            //     trailing: CupertinoSwitch(
            //         value: ThemeService.isSavedDarkMode(),
            //         onChanged: (value) {
            //           ThemeService().setDarkThemeMode(value);
            //           setState(() {});
            //         })),
            getSettingsTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: "Logout",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
          ],
        ),
      ),
    );
  }

  Widget getSettingsTile({required Widget leading, required String title, VoidCallback? onTap, required Widget trailing}) {
    return Container(
      height: Get.height / 13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Color(0xffE2E4EB),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(8.sp),
      child: ListTile(
        enabled: true,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
          ),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
