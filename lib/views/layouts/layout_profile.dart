import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_edit_profile.dart';
import 'package:paulineife_user/views/screens/screen_following.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:sizer/sizer.dart';
import '../../constant/constant.dart';
import '../../helpers/theme.dart';
import '../screens/screen_follower.dart';
import '../screens/screen_setting.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({Key? key}) : super(key: key);

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Themes.setColor(context) ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text(
            'Asad',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                
                color: Colors.black),
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_rounded),
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
                                  
                                  color: Color(0xff000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: '@asad',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      
                                      color: Color(0xff2A70C8),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 27.sp,
                        ),
                        onPressed: () {
                          Get.to(SettingScreen());
                        },
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
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        
                        color: Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text: '\nwww.google.com',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            
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
                      onTap: () {
                        Get.to(FollowerScreen());
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '10k\n',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: 'Followers',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  
                                  color: Color(0xff79869F),
                                ),
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(FollowingScreen());
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '1.1k\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'Following',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                
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
                CustomButton1(
                    text: 'Edit Profile',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      
                      color: Colors.black,
                    ),
                    elevation: 0,
                    height: Get.height / 16,
                    width: Get.width / 1.2,
                    color: Color(0xffE2E4EB),
                    onPressed: () {
                      Get.to(ProfileEditScreen());
                    }),
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
                              SizedBox(width: 3.sp,),
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
