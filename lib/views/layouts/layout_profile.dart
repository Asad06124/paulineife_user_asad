import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_edit_profile.dart';
import 'package:paulineife_user/views/screens/screen_following.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:sizer/sizer.dart';
import '../screens/screen_follower.dart';
import '../screens/screen_setting.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asad'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_rounded),
      ),
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.sp,
                        backgroundImage: AssetImage(
                            'assets/images/12.png'),
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
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 30.sp,
                    ),
                    onPressed: () { Get.to(SettingScreen()); },
                  ),
                ),
              ]),
          SizedBox(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Lorem ipsum dolor sit amet, consectetur eliteita adipiscing elit. Morbi at malesuada mi.',
                style: TextStyle(
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
                onTap: (){
                  Get.to(FollowingScreen());
                },
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
          CustomButton1(
              text: 'Edit Profile',
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
          Expanded(
            child: Text(
              'No Posts',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSansR',
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
