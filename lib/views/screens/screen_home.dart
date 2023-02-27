import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paulineife_user/views/layouts/layout_home.dart';
import 'package:paulineife_user/views/layouts/layout_notification.dart';
import 'package:paulineife_user/views/layouts/layout_profile.dart';
import 'package:paulineife_user/views/layouts/layout_search.dart';
import 'package:paulineife_user/views/screens/screen_post_image.dart';
import 'package:paulineife_user/views/screens/screen_post_text.dart';
import 'package:paulineife_user/views/screens/screen_post_video.dart';
import 'package:sizer/sizer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../controller/registration_controller.dart';
import '../../widgets/custom_buttom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(RegistrationController());

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        HomeLayout(),
        SearchLayout(),
        HomeLayout(),
        NotificationLayouts(),
        ProfileLayout(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_filled),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/svgs/Search.svg"),
          title: ("Settings"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          onPressed: (val) {
            Get.bottomSheet(
              Container(
                height: 35.h + 5,
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
                        'Create Post',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSansR'),
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          Get.bottomSheet(
                            Container(
                              height: 18.h,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.back();
                                      getFromCameraimg();
                                    },
                                    leading: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Color(
                                        0xff97A1B4,
                                      ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Camera',
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
                                      Get.back();

                                      getFromGalleryimg();
                                    },
                                    leading: Icon(
                                      Icons.photo,
                                      color: Color(
                                        0xff97A1B4,
                                      ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Gallery',
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
                            backgroundColor: Color(0xffffffff),
                            elevation: 0,
                          );
                        });
                      },
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: Color(
                          0xff97A1B4,
                        ),
                        size: 20.sp,
                      ),
                      title: Text(
                        'Image Post',
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
                        Get.to(PostTextScreen());
                      },
                      leading: Icon(
                        Icons.text_snippet_outlined,
                        color: Color(
                          0xff97A1B4,
                        ),
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
                    Divider(
                      color: Color(0xffE2E4EB),
                      thickness: 2.sp,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          Get.bottomSheet(
                            Container(
                              height: 18.h,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.back();
                                      getFromCameravid();
                                    },
                                    leading: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Color(
                                        0xff97A1B4,
                                      ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Camera',
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
                                      Get.back();
                                      getFromGalleryvid();
                                    },
                                    leading: Icon(
                                      Icons.photo,
                                      color: Color(
                                        0xff97A1B4,
                                      ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Gallery',
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
                            backgroundColor: Color(0xffffffff),
                            elevation: 0,
                          );
                        });
                      },
                      leading: Icon(
                        Icons.videocam_outlined,
                        color: Color(
                          0xff97A1B4,
                        ),
                        size: 20.sp,
                      ),
                      title: Text(
                        'Video Post',
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
          icon: SvgPicture.asset("assets/svgs/add.svg"),
          title: ("Settings"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/svgs/Notification.svg"),
          title: ("Settings"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          title: ("Settings"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }

  void getFromGalleryvid() async {
    final pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        Get.to(PostVideoScreen());
        controller.vid = File(pickedFile.path);
      });
    }
  }

  void getFromCameravid() async {
    final pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        Get.to(PostVideoScreen());
        controller.vid = File(pickedFile.path);
      });
    }
  }

  void getFromGalleryimg() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        Get.to(PostImageScreen());
        controller.img = File(pickedFile.path);
      });
    }
  }

  void getFromCameraimg() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        Get.to(PostImageScreen());
        controller.img = File(pickedFile.path);
      });
    }
  }
}
