import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          title: Text(
            'Settings',
            style: getAppbarTextTheme(),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
              )),
          centerTitle: true,
        ),
        body: Column(
          children: [
            getSettingsTile(
                leading: Icon(
                  Icons.chat_bubble_outline,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
                title: "FAQ & Contact Support",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
                title: "About Us",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.view_list_sharp,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
                title: "Terms & Conditions",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.chat_bubble_outline,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
                title: "Privacy Policy",
                trailing: Icon(
                  Icons.privacy_tip,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                )),
            getSettingsTile(
                leading: Icon(
                  Icons.mode_night,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
                title: "Dark Mode",
                trailing: CupertinoSwitch(
                    value: ThemeService.isSavedDarkMode(),
                    onChanged: (value) {
                      ThemeService().setDarkThemeMode(value);
                      setState(() {});
                    })),
            getSettingsTile(
                leading: Icon(
                  Icons.logout,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
                onTap: () {
                  showIosDialog(
                    context: context,
                    title: "Logout",
                    message: "Are you sure to logout?",
                    onConfirm: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Get.offAll(ScreenLogin());
                    },
                    confirmText: "Logout",
                    cancelText: "Dismiss"
                  );
                },
                title: "Logout",
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff97A1B4),
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
