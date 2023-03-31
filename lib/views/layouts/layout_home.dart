import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:sizer/sizer.dart';

import '../../constant/constant.dart';
import '../../controller/otp_controller.dart';
import '../../helpers/theme_service.dart';
import '../../widgets/status_view_custom.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    List StoryCount = [1, 2, 5, 6, 8];

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 2.sp),
            child: Text(
              'Roll Upp',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Color(0xff2A70C8), fontFamily: 'ubuntu'),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 2.sp),
              child: IconButton(
                onPressed: () {
                  Get.to(ChatListScreen());
                },
                icon: Badge(
                  badgeContent: Text(
                    '1',
                    style: TextStyle(
                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                    ),
                  ),
                  position: BadgePosition.topEnd(end: -7, top: -13),
                  child: SvgPicture.asset("assets/svgs/email.svg"),
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        ),
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: size.width / 1.08,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: StoryCount.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.sp, bottom: 2.sp, left: 4.sp, right: 4.sp),
                          child: StatusViewCustom(
                            onTap: () {
                              index != 0
                                  ? Get.to(StoryViewScreen())
                                  : controller.StoryImg == null || index == 0
                                      ? Get.bottomSheet(
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
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                                          elevation: 0,
                                        )
                                      : Get.to(StoryViewScreen());
                              ;
                            },
                            radius: 25.sp,
                            spacing: 8.sp,
                            strokeWidth: 2,
                            indexOfSeenStatus: 1,
                            numberOfStatus: 1,
                            padding: 4,
                            centerImageUrl: index != 0 ? 'assets/images/12.png' : 'assets/images/camera.png',
                            seenColor: Color(0xff3AA0FF),
                            unSeenColor: Colors.red,
                          ),
                        ),
                        Text(
                          index == 0 ? 'Your Story' : 'Asad',
                          style: TextStyle(
                              color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                              fontSize: font12,
                              fontWeight: FontWeight5,
                              fontFamily: fontFamilyD),
                        )
                      ],
                    );
                  },
                ),
              )),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(StoryViewScreen());
                      },
                      child: Container(
                        height: size.height / 1.8 + 15,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          image: DecorationImage(image: AssetImage('assets/images/post.png'), fit: BoxFit.cover),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ProfileScreen());
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 40.sp,
                                    width: 40.sp,
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                                        )),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/12.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.sp,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Asad Ullah',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.sp,
                                      ),
                                      Text(
                                        '2 hours ago',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/images/refresh.svg'),
                        GestureDetector(
                            onTap: () {
                              Get.to(StoryViewScreen());
                            },
                            child: SvgPicture.asset('assets/images/repeat.svg')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getFromGalleryimg() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.StoryImg = File(pickedFile.path);
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
        controller.StoryImg = File(pickedFile.path);
      });
    }
  }
}
