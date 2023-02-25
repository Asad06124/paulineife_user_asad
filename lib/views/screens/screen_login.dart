import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/registration_controller.dart';
import 'package:paulineife_user/views/screens/screen_forget_password_with_layouts.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/views/screens/screen_signup_google.dart';
import 'package:paulineife_user/views/screens/screen_signup_with_layouts.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_input_field1.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  bool isPasswordField = false;
  final _formKey = GlobalKey<FormState>();

  var controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: WHeight.height / 8,
                ),
                SvgPicture.asset('assets/images/logos.svg'),
                SizedBox(
                  height: WHeight.height / 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Color(0xffD6D9E3),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, top: 2),
                          child: Text(
                            'Phone / Username / Email',
                            style: TextStyle(
                                fontFamily: 'DMSansR',
                                color: Color(0xff79869F),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: WHeight.height / 20,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Text is required";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                hintStyle: TextStyle(
                                    fontFamily: 'DMSansR',
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                contentPadding: EdgeInsets.only(left: 5),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: WHeight.height / 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Color(0xffD6D9E3),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, top: 2),
                          child: Text(
                            'Password',
                            style: TextStyle(
                                fontFamily: 'DMSansR',
                                color: Color(0xff79869F),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          height: WHeight.height / 18,
                          child: TextFormField(
                            obscureText: isPasswordField,
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Text is required";
                              }
                              return null;
                            },

                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordField = !isPasswordField;
                                  });
                                },
                                icon: Icon(isPasswordField
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: '........',
                              hintStyle: TextStyle(
                                  fontFamily: 'DMSansR',
                                  color: Color(0xff000000),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 5),
                            ),

                            // decoration: InputDecoration(
                            //   suffixIcon: IconButton(
                            //     onPressed: () {
                            //       visible = !visible;
                            //     },
                            //     icon: visible == false
                            //         ? Icon(Icons.visibility)
                            //         : Icon(Icons.visibility_off),
                            //   ),
                            //   hintText: '.......',
                            //   hintStyle: TextStyle(
                            //       fontFamily: 'DMSansR',
                            //       color: Color(0xff000000),
                            //       fontSize: 20.sp,
                            //       fontWeight: FontWeight.w400),
                            //   contentPadding: EdgeInsets.only(left: 5),
                            //   border: InputBorder.none,
                            //   focusedBorder: InputBorder.none,
                            //   enabledBorder: InputBorder.none,
                            //   errorBorder: InputBorder.none,
                            //   disabledBorder: InputBorder.none,
                            // ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3, right: 26.sp),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(ScreeForgetPasswordWithLayouts());
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff79869F),
                                fontFamily: 'DMSansR'),
                          ))),
                ),
                CustomButton1(
                  text: 'Sign in',
                  color: Color(0xff2A70C8),
                  width: WHeight.width / 1.2,
                  height: WHeight.height / 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.sp)),
                  ),
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSansR'),
                  onPressed: () {
                    Get.to(HomeScreen());
                  },
                ),
                Text(
                  'Or Sign in with',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff79869F),
                      fontFamily: 'DMSansR'),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: SignInButton(
                    Buttons.Google,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.sp)),
                        side: BorderSide(color: Color(0xff97A1B4))),
                    text: "Sign up with Google",
                    onPressed: () {
                      Get.to(SignUpGoogleScreen());
                    },
                  ),
                  width: WHeight.width / 1.2,
                  height: WHeight.height / 15,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(ScreeSignUpWithLayouts());
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Don’t have an account?',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSansR',
                              color: Color(0xff000000)),
                          children: [
                            TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'DMSansR',
                                    color: Color(0xff2A70C8)))
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
