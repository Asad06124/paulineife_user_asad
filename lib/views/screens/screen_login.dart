import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/registration_controller.dart';
import 'package:paulineife_user/helpers/theme.dart';
import 'package:paulineife_user/views/screens/screen_forget_password_with_layouts.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/views/screens/screen_signup_google.dart';
import 'package:paulineife_user/views/screens/screen_signup_menu.dart';
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

    Get.to(SignUpMenuScreen());
  }

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Themes.setColor(context) ? Colors.black : Colors.white,

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 22.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: WHeight.height / 12,
                    ),
                    SvgPicture.asset('assets/images/logos.svg'),
                    SizedBox(
                      height: WHeight.height / 15,
                    ),
                    Container(
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
                                  
                                  color: Color(0xff79869F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
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
                                      
                                      color: Themes.setColor(context) ? Colors.white :  Color(0xff000000),
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
                    SizedBox(
                      height: WHeight.height / 40,
                    ),
                    Container(
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
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,color:Color(0xff79869F) ,),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: '........',
                                hintStyle: TextStyle(
                                    
                                    color:Themes.setColor(context) ? Colors.white :  Color(0xff000000),
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
                              //         : Icon(Icons.visibility_off_outlined),
                              //   ),
                              //   hintText: '.......',
                              //   hintStyle: TextStyle(
                              //       
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(ScreeForgetPasswordWithLayouts());
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff79869F),
                              ),
                        ),
                      ),
                    ),
                    CustomButton1(
                      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 20,),
                      text: 'Sign in',
                      color: Color(0xff2A70C8),
                      width: Get.width,
                      height: WHeight.height / 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.sp)),
                      ),
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        color: Colors.white
                          ),
                      onPressed: () {
                        Get.to(HomeScreen());
                      },
                    ),
                    Text(
                      'Or Sign in with',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color:Themes.setColor(context) ? Colors.white : Color(0xff79869F) ,
                          ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){Get.to(HomeScreen());},
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.sp),
                            color: Color(0xffE2E4EB),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                               Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  fit: BoxFit.cover,
                                  height: 30.sp,
                                  width: 30.sp,
                                ),
                                SizedBox(width: 10.sp,),
                                Text(
                                  'Continue with Google ',
                                  style: TextStyle(
                                    color: Themes.setColor(context) ? Colors.white : Colors.black,
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
                      height: 40.sp,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Don’t have an account?',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,

                              color: Themes.setColor(context) ? Colors.white : Color(0xff000000)),
                          children: [
                            TextSpan(text: ' '),
                            TextSpan(
                                text: 'Sign up',
                                recognizer: _longPressRecognizer,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,

                                    color: Color(0xff2A70C8)))
                          ]),
                    ),
                    SizedBox(height: 10.sp,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
