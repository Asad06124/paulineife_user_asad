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
  final scrollController = ScrollController(
      initialScrollOffset:
          9); // set the initial scroll offset to start at line 10
  @override
  Widget build(BuildContext context) {
    bool swtch = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 6.sp,
                    ),
                    Text(
                      'Allow Comments',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DMSansR',
                          color: Colors.black),
                    ),
                    Spacer(),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Switch(
                          activeColor: Color(0xff3AA0FF),
                          activeTrackColor: Color(0xffD5EBFF),
                          value: swtch,
                          onChanged: (val) {
                            setState(() {
                              swtch = val;
                            });
                          });
                    }),
                  ],
                ),
              ),
              Container(
                height: 53.5.h,
                color: Colors.black,
                child: CustomInputField1(
                  scrollController: scrollController,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
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
              Container(
                height: 75.sp,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(8.sp),
                      alignment: Alignment.center,
                      height: 70.sp,
                      width: 50.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: Color(0xff000000),
                      ),
                      child: index == 0
                          ? Icon(
                              Icons.add_circle_outline_outlined,
                              color: Colors.white,
                            )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.text_snippet_outlined,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                SizedBox(height: 2.sp,),
                                Text(
                                  'Type Here',
                                  style: TextStyle(
                                    fontSize: 6.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 58.sp,
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
                  height: 34.h + 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.sp),
                        topRight: Radius.circular(20.sp),
                      ),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 35.sp),
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
                        onTap: () {
                          Get.to(HomeScreen());
                        },
                        leading: Icon(
                          Icons.text_snippet_outlined,
                          color: Color(
                            0xff97A1B4,
                          ),
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
                        onTap: () {
                          Get.to(HomeScreen());
                        },
                        leading: SvgPicture.asset('assets/svgs/thread.svg'),
                        title: Text(
                          'Thread',
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
            child: SvgPicture.asset('assets/svgs/Vector.svg'),
            backgroundColor: Color(0xff2A70C8),
          ),
        ),
      ),
    );
  }
}
