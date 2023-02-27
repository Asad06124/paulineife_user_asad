import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/layouts/layout_home.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:paulineife_user/widgets/custom_input_field1.dart';
import 'package:sizer/sizer.dart';
import '../../controller/registration_controller.dart';

class PostTextScreen extends StatelessWidget {
  PostTextScreen({
    Key? key,
  }) : super(key: key);
  var controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    bool swtch = true;
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text('Create Post'),
          centerTitle: true,
          toolbarHeight: 60.sp,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                ),
                title: Text(
                  'Allow Comments',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSansR',
                      color: Colors.black),
                ),
                trailing: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Switch(
                      value: swtch,
                      onChanged: (val) {
                        setState(() {
                          swtch = val;
                        });
                      });
                }),
              ),
              Container(
                height: 65.h,
                color: Colors.black,
                child: CustomInputField1(
                  textStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  maxLines: 15,
                  hint: 'Type Here',
                  hintStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSansR',
                      color: Colors.white,

                  ),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 5.sp),
          child: FloatingActionButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  height: 32.h+5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.sp),
                        topRight: Radius.circular(20.sp),
                      ),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.sp),
                        child: Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSansR'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.sp),
                        child: Text(
                          'Post text as',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DMSansR'),
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      ListTile(
                        onTap: (){
                          Get.to(HomeScreen());
                        },
                        leading: Icon(
                          Icons.text_snippet_outlined,
                          color: Color(0xff97A1B4,),
                          size: 20.sp,
                        ),
                        title: Text(
                          'Normal Text',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff000000,
                            ),
                            fontFamily: 'DMSansR',
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xffE2E4EB),
                        thickness: 2.sp,
                      ),
                      ListTile(
                        onTap: (){
                          Get.to(HomeScreen());
                        },
                        leading: Icon(
                          Icons.layers_outlined,
                          color: Color(0xff97A1B4,),
                          size: 20.sp,
                        ),
                        title: Text(
                          'Text Post',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff000000,
                            ),
                            fontFamily: 'DMSansR',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              );
            },
            child: SvgPicture.asset('assets/images/Vector.svg'),
            backgroundColor: Color(0xff2A70C8),
          ),
        ),
      ),
    );
  }
}
