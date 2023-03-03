import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/registration_controller.dart';

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';import '../../widgets/custom_buttom.dart';
import 'screen_terms_conditions.dart';

class SignUpPhoneDetailsScreen extends StatelessWidget {
   SignUpPhoneDetailsScreen({Key? key}) : super(key: key);
   bool isPasswordField = false;
   final _formKey = GlobalKey<FormState>();

   var controller = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Text(
              'Sign Up',
              style: getAppbarTextTheme().copyWith(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.only(top: 12.sp),
                height: Get.height / 12,
                width: Get.width / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD6D9E3),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: TextEditingController(text: 'Example_123'),
                  decoration: InputDecoration(
                    label: Text('Username',style: TextStyle(
                        
                        color: Color(0xff79869F),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.sp, top: 10.sp),
                    padding: EdgeInsets.only(top: 12.sp),
                    height: Get.height / 12,
                    width: Get.width / 2.3,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD6D9E3),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: TextEditingController(text: 'Example'),
                      decoration: InputDecoration(
                        label: Text('First Name',style: TextStyle(
                            
                            color: Color(0xff79869F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.sp, top: 10.sp),
                    padding: EdgeInsets.only(top: 12.sp),
                    height: Get.height / 12,
                    width: Get.width / 2.3,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD6D9E3),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: TextEditingController(text: 'Example'),
                      decoration: InputDecoration(
                        label: Text('Last Name',style: TextStyle(
                            
                            color: Color(0xff79869F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 5.sp, top: 10.sp),
                padding: EdgeInsets.only(top: 12.sp),
                height: Get.height / 12,
                width: Get.width / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD6D9E3),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: TextEditingController(text: '15/06/2000'),
                  decoration: InputDecoration(
                    label: Text('Date of Birth',style: TextStyle(
                        
                        color: Color(0xff79869F),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.sp, top: 10.sp),
                padding: EdgeInsets.only(left: 5.sp),
                height: Get.height / 12,
                width: Get.width / 1.1,
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
                        'New Password',style: TextStyle(
                          
                          color: Color(0xff79869F),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Container(
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
                                    : Icons.visibility_off_outlined),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: '........',
                              hintStyle: TextStyle(

                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
                        );
                      },
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.sp, top: 10.sp),
                padding: EdgeInsets.only(left: 5.sp),
                height: Get.height / 12,
                width: Get.width / 1.1,
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
                        'Retype Password',style: TextStyle(
                          
                          color: Color(0xff79869F),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Container(
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
                                    : Icons.visibility_off_outlined),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: '........',
                              hintStyle: TextStyle(

                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
                        );
                      },
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomButton1(
                text: 'Sign up',
                color: Color(0xff2A70C8),
                width: WHeight.width / 1.2,
                height: WHeight.height / 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.sp)),
                ),
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                    ),
                onPressed: () {
                  Get.to(TermsConditionsScreen());
                },
              ),
              TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                        text: 'Already Have an Account? ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  
                                  color: Color(0xff2A70C8)))
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
