import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat.dart';
import 'package:paulineife_user/views/screens/screen_follower.dart';
import 'package:paulineife_user/views/screens/screen_following.dart';
import 'package:paulineife_user/views/screens/screen_report.dart';
import 'package:paulineife_user/views/screens/screen_setting.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:sizer/sizer.dart';

import '../../constant/constant.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Asad',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'DMSansR',
                color: Colors.black),
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_rounded),
          actions: [ PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
            icon: Icon(
              Icons.more_vert,
              color: Color(0xff97A1B4),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Get.to(ReportScreen());
                  });
                },
                child: Text(
                  'Report',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFF0000),
                      fontFamily: 'DMSansR'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'Block',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                      fontFamily: 'DMSansR'),
                ),
              ),
            ],
          ),],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xff3AA0FF), width: 3.sp)),
                            child: CircleAvatar(
                              radius: 30.sp,
                              backgroundImage: AssetImage('assets/images/12.png'),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Asad\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSansR',
                                  color: Color(0xff000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: '@asad',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'DMSans-Bold',
                                      color: Color(0xff2A70C8),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(
                  height: 10.sp,
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text:
                      'Lorem ipsum dolor sit amet, consectetur eliteita adipiscing elit. Morbi at malesuada mi.',
                      style: TextStyle(
                        height: 1.sp,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSansR',
                        color: Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text: '\nwww.google.com',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSans-Bold',
                            color: Color(0xff2A70C8),
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    GestureDetector(
                      onTap: (){Get.to(FollowerScreen());},
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '10k\n',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSans-Bold',
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: 'Followers',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DMSansR',
                                  color: Color(0xff79869F),
                                ),
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){Get.to(FollowingScreen());},
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '1.1k\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSansR-Bold',
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'Following',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSansR',
                                color: Color(0xff79869F),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
                Row(
                  children:[
                    CustomButton1(
                        text: '+ Follow',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSansR',
                          color: Colors.white,
                        ),
                        elevation: 0,
                        height: Get.height / 16,
                        width: Get.width / 2.5,
                        color: Color(0xff2A70C8),
                        onPressed: () {}),
                    CustomButton1(
                        text: 'Message',
                        decuration: BoxDecoration(border: Border.all(color: Color(0xff000000),),borderRadius: BorderRadius.circular(10.sp)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),

                        ),
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSansR',
                          color: Colors.black,
                        ),
                        elevation: 0,
                        height: Get.height / 16,
                        width: Get.width / 2.5,
                        color: Color(0xffffffff),
                        onPressed: () {Get.to(ChatScreen());}),
                  ],
                ),
                Divider(
                  color: Color(0xffa4a4a4),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 16,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.sp,
                      mainAxisSpacing: 2.sp),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // _generateRandomNumber();
                        Get.to(StoryViewScreen());
                      },
                      child: Container(
                        alignment: Alignment.bottomRight,
                        // padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/12.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: Get.width,
                                  height: Get.height,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x0),
                                        Color(0xeb000000),
                                      ],
                                      stops: [0.6, 10.0,],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                )),
                            Positioned(
                              top: 2.sp,
                              right: 2.sp,
                              child: Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 20.sp,
                                width: 20.sp,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      4.sp,
                                    ),
                                    color: Color(0x5effffff)),
                                child: Text(
                                  '5',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5.sp,
                              right: 5.sp,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                    size: 15.sp,
                                  ),
                                  Text(
                                    '20.5K',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: fontFamilyD,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
