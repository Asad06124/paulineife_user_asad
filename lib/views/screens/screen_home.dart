import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paulineife_user/helpers/theme_service.dart';
import 'package:paulineife_user/views/layouts/layout_home.dart';
import 'package:paulineife_user/views/layouts/layout_notification.dart';
import 'package:paulineife_user/views/layouts/layout_profile.dart';
import 'package:paulineife_user/views/layouts/layout_search.dart';
import 'package:paulineife_user/views/screens/screen_post_image.dart';
import 'package:paulineife_user/views/screens/screen_post_text.dart';
import 'package:paulineife_user/views/screens/screen_post_video.dart';
import 'package:paulineife_user/views/screens/screen_video_gallery.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../../controller/registration_controller.dart';
import '../../helpers/fetch_all_videos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(RegistrationController());

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

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
        ProfileLayout(
          onThemeUpdate: () {
            setState(() {});
          },
        ),
      ],
      items: [
        PersistentBottomNavBarItem(
          onPressed: (val) {
            setState(() {
              _controller.index = 0;
            });
          },
          icon: _controller.index == 0
              ? Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: ThemeService.isSavedDarkMode()
                      ? SvgPicture.asset("assets/svgs/Home_opened_black.svg")
                      : SvgPicture.asset("assets/svgs/Home_opened.svg"),
                )
              : ThemeService.isSavedDarkMode()
                  ? SvgPicture.asset("assets/svgs/Home_closed_black.svg")
                  : SvgPicture.asset("assets/svgs/Home_closed.svg"),
          activeColorPrimary: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
          title: ("Settings"),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          onPressed: (val) {
            setState(() {
              _controller.index = 1;
            });
          },
          icon: _controller.index == 1
              ? Padding(
                  padding: EdgeInsets.only(bottom: 6.0),
                  child: ThemeService.isSavedDarkMode()
                      ? SvgPicture.asset("assets/svgs/Search_opened_black.svg")
                      : SvgPicture.asset("assets/svgs/search_opened.svg"),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 6.0),
                  child: ThemeService.isSavedDarkMode()
                      ? SvgPicture.asset("assets/svgs/Search_closed_black.svg")
                      : SvgPicture.asset("assets/svgs/search_closed.svg"),
                ),
          activeColorPrimary: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
          title: ("Settings"),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          onPressed: (val) {
            setState(() {
              _controller.index = 2;
              _controller.index = 0;
            });
            Get.bottomSheet(
              Container(
                height: 38.h + 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                  color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.sp),
                      child: Text(
                        'Create Post',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                        ),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.sp),
                                  topRight: Radius.circular(20.sp),
                                ),
                                color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Colors.white,
                              ),
                              height: 18.h,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.back();
                                      getFromCameraimg(false);
                                    },
                                    leading: Icon(
                                      Icons.camera_alt_outlined,
                                      color: ThemeService.isSavedDarkMode()
                                          ? Colors.white
                                          : Color(
                                              0xff97A1B4,
                                            ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Camera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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

                                      setState(() {
                                        Get.bottomSheet(
                                          Container(
                                            height: 34.5.h + 5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.sp),
                                                topRight: Radius.circular(20.sp),
                                              ),
                                              color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: 35.sp),
                                                  child: Text(
                                                    'Post',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.w700,
                                                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 15.sp),
                                                  child: Text(
                                                    'Post image as',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15.sp,
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    getFromGalleryimg(true);
                                                  },
                                                  leading: SvgPicture.asset(
                                                    'assets/svgs/gallery.svg',
                                                    color: ThemeService.isSavedDarkMode()
                                                        ? Colors.white
                                                        : Color(
                                                            0xff97A1B4,
                                                          ),
                                                  ),
                                                  title: Text(
                                                    'Normal images',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Color(0xffE2E4EB),
                                                  thickness: 2.sp,
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    getFromGalleryimg(false);
                                                  },
                                                  leading: SvgPicture.asset('assets/svgs/thread.svg',color: ThemeService.isSavedDarkMode()
                                                      ? Colors.white
                                                      : Color(
                                                    0xff97A1B4,
                                                  ),),
                                                  title: Text(
                                                    'Thread',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                        );
                                      });
                                    },
                                    leading: Icon(
                                      Icons.photo,
                                      color: ThemeService.isSavedDarkMode()
                                          ? Colors.white
                                          : Color(
                                              0xff97A1B4,
                                            ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Gallery',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          );
                        });
                      },
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: ThemeService.isSavedDarkMode()
                            ? Colors.white
                            : Color(
                                0xff97A1B4,
                              ),
                        size: 20.sp,
                      ),
                      title: Text(
                        'Image Post',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
                        color: ThemeService.isSavedDarkMode()
                            ? Colors.white
                            : Color(
                                0xff97A1B4,
                              ),
                        size: 20.sp,
                      ),
                      title: Text(
                        'Text Post',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.sp),
                                  topRight: Radius.circular(20.sp),
                                ),
                                color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Colors.white,
                              ),
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
                                      color: ThemeService.isSavedDarkMode()
                                          ? Colors.white
                                          : Color(
                                        0xff97A1B4,
                                      ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Camera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
                                      setState(() {
                                        getFromGalleryvid();
                                      });
                                    },
                                    leading: Icon(
                                      Icons.photo,
                                      color: ThemeService.isSavedDarkMode()
                                          ? Colors.white
                                          : Color(
                                        0xff97A1B4,
                                      ),
                                      size: 20.sp,
                                    ),
                                    title: Text(
                                      'Gallery',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          );
                        });
                      },
                      leading: Icon(
                        Icons.videocam_outlined,
                        color: ThemeService.isSavedDarkMode()
                            ? Colors.white
                            : Color(
                                0xff97A1B4,
                              ),
                        size: 20.sp,
                      ),
                      title: Text(
                        'Video Post',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
          icon: Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: ThemeService.isSavedDarkMode() ? SvgPicture.asset("assets/svgs/Add_black.svg") : SvgPicture.asset("assets/svgs/add.svg"),
          ),
          activeColorPrimary: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          onPressed: (val) {
            setState(() {
              _controller.index = 3;
            });
          },
          icon: Badge(
            badgeContent: Text(
              '1',
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topEnd(end: -7, top: -13),
            child: _controller.index == 3
                ? ThemeService.isSavedDarkMode()
                    ? SvgPicture.asset("assets/svgs/Notification_opened_black.svg")
                    : SvgPicture.asset("assets/svgs/Notification_opened.svg")
                : ThemeService.isSavedDarkMode()
                    ? SvgPicture.asset("assets/svgs/Notification_closed_black.svg")
                    : SvgPicture.asset("assets/svgs/Notification_closed.svg"),
          ),
          title: ("Settings"),
          activeColorPrimary: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          onPressed: (val) {
            setState(() {
              _controller.index = 4;
            });
          },
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3.0),
            child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xff3AA0FF), width: 2.sp)),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/12.png'),
                )),
          ),
          title: ("Settings"),
          activeColorPrimary: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
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
        colorBehindNavBar: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
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
      navBarStyle: NavBarStyle.style13, // Choose the nav bar style with this property.
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

  void getFromGalleryimg(isNormal) async {
    final pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        pickedFile.forEach((element) {
          controller.images.add(File(element.path));
        });
        Get.to(PostImageScreen(
          isnormal: isNormal,
        ));
        controller.img = controller.images[0];
      });
    }
  }

  void getFromCameraimg(isNormal) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        Get.to(PostImageScreen(
          isnormal: isNormal,
        ));
        controller.img = File(pickedFile.path);
      });
    }
  }
}
