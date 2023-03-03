import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_login.dart';
import 'package:paulineife_user/views/screens/screen_signup_google.dart';
import 'package:paulineife_user/views/screens/screen_signup_with_layouts.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';
import '../../widgets/custom_buttom.dart';

class SignUpMenuScreen extends StatefulWidget {
  SignUpMenuScreen({Key? key}) : super(key: key);

  @override
  State<SignUpMenuScreen> createState() => _SignUpMenuScreenState();
}

class _SignUpMenuScreenState extends State<SignUpMenuScreen> {
  late TapGestureRecognizer _longPressRecognizer;

  @override
  void initState() {
    super.initState();
    _longPressRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  @override
  void dispose() {
    _longPressRecognizer.dispose();
    super.dispose();
  }

  void _handlePress() {
    HapticFeedback.vibrate();

    Get.to(ScreenLogin());
  }

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Text(
              'Sign Up',
              style: getAppbarTextTheme().copyWith(
                fontSize: 21.sp,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: WHeight.height / 15,
            ),
            SvgPicture.asset(
              'assets/images/logos.svg',
            ),
            SizedBox(
              height: WHeight.height / 12,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Color(0xffE2E4EB),
                ),
                child: ListTile(
                  onTap: () {
                    Get.to(ScreeSignUpWithLayouts());
                  },
                  leading: Icon(
                    Icons.person,
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Continue with Phone/Email',
                    style: TextStyle(
                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                width: WHeight.width / 1.2,
                height: WHeight.height / 13.2,
              ),
            ),
            Text(
              'Or Sign in with',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.to(SignUpGoogleScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Color(0xffE2E4EB),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svgs/google.svg'),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'Continue with Google ',
                        style: TextStyle(
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  width: WHeight.width / 1.2,
                  height: WHeight.height / 13.2,
                ),
              ),
            ),
            SizedBox(
              height: WHeight.height / 6,
            ),
            RichText(
              text: TextSpan(
                  text: 'Already Have an Account?',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(text: '  '),
                    TextSpan(
                        text: 'Sign In',
                        recognizer: _longPressRecognizer,
                        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: Color(0xff2A70C8)))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
