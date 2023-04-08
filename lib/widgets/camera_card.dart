import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paulineife_user/widgets/status_view_custom.dart';
import 'package:sizer/sizer.dart';

import '../constant/constant.dart';
import '../controller/home_controller.dart';
import '../helpers/theme_service.dart';

class CameraCard extends StatefulWidget {
  const CameraCard({Key? key}) : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 1.sp,
                    bottom: 2.sp,
                    left: 4.sp,
                    right: 4.sp,
                  ),
                  child: Container(
                    child: StatusViewCustom(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.back();
                                    controller.update();
                                    getFromCameraImg();
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
                                    controller.update();
                                    getFromGalleryImg();
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
                        );
                      },
                      radius: 25.sp,
                      type: 'camera',
                      spacing: 8.sp,
                      strokeWidth: 2,
                      indexOfSeenStatus: 1,
                      numberOfStatus: 1,
                      padding: 4,
                      centerImageUrl: 'assets/images/camera.png',
                      seenColor: Color(0xff3AA0FF),
                      unSeenColor: Colors.red,
                    ),
                  ),
                ),
                Text(
                  'Your Story',
                  style: TextStyle(
                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      fontSize: font12,
                      fontWeight: FontWeight5,
                      fontFamily: fontFamilyD),
                )
              ],
            ),
          );
        });
  }

  void getFromCameraImg() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.StoryImg = File(pickedFile.path);
        controller.update();
      });
    }
  }

  void getFromGalleryImg() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.StoryImg = File(pickedFile.path);
        controller.update();
      });
    }
  }
}
