import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_buttom.dart';
import 'screen_terms_conditions.dart';

class SignUpPhoneDetailsScreen extends StatelessWidget {
  const SignUpPhoneDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSansR',
                  color: Colors.black),
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
                    label: Text('Username'),
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
                        label: Text('First Name'),
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
                        label: Text('Last Name'),
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
                  controller: TextEditingController(text: 'Example_123'),
                  decoration: InputDecoration(
                    label: Text('Username'),
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
                width: Get.width / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD6D9E3),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: TextEditingController(text: 'Example_123'),
                  decoration: InputDecoration(
                    label: Text('Username'),
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
                width: Get.width / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD6D9E3),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: TextEditingController(text: 'Example_123'),
                  decoration: InputDecoration(
                    label: Text('Username'),
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
              SizedBox(height: 8.h,),
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
                  Get.to(TermsConditionsScreen());
                },
              ),
              TextButton(
                  onPressed: () {},
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
    );
  }
}
