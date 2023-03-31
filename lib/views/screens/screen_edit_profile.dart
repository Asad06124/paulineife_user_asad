import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paulineife_user/controller/otp_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';
import '../../widgets/custom_buttom.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  var controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Edit Profile',
            style: getAppbarTextTheme().copyWith(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
              )),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.sp,
                  backgroundImage: controller.img != null
                      ? FileImage(
                          File(
                            controller.img!.path,
                          ),
                        ) as ImageProvider
                      : AssetImage(
                          'assets/images/12.png',
                        ),
                ),
                TextButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Row(
                        children: [
                          CustomButton1(
                              text: 'Camera',
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                              ),
                              elevation: 0,
                              height: Get.height / 16,
                              width: Get.width / 2.3,
                              color: Color(0xff2A70C8),
                              onPressed: () {
                                setState(() {
                                  Get.back();
                                  _getFromCamera();
                                });
                              }),
                          CustomButton1(
                              text: 'Gallery',
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                              ),
                              elevation: 0,
                              height: Get.height / 16,
                              width: Get.width / 2.3,
                              color: Color(0xff2A70C8),
                              onPressed: () {
                                Get.back();
                                _getFromGallery();
                              }),
                        ],
                      ),
                      backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                      elevation: 0,
                    );
                  },
                  child: Text(
                    'Change Profile Photo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2A70C8),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 12.sp),
                    height: Get.height / 12,
                    width: Get.width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD6D9E3),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: TextEditingController(text: 'Asad'),
                      style: TextStyle(
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          'Name',
                          style: TextStyle(
                            color: Color(0xff79869F),
                          ),
                        ),
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
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 12.sp),
                    height: Get.height / 12,
                    width: Get.width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD6D9E3),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: TextEditingController(text: 'AsadBalqani'),
                      style: TextStyle(
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          'UserName',
                          style: TextStyle(
                            color: Color(0xff79869F),
                          ),
                        ),
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
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 12.sp),
                    height: Get.height / 12,
                    width: Get.width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD6D9E3),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: TextEditingController(text: 'www.microprogramers.org'),
                      style: TextStyle(
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          'Website',
                          style: TextStyle(
                            color: Color(0xff79869F),
                          ),
                        ),
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
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 12.sp),
                    height: Get.height / 12,
                    width: Get.width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffD6D9E3),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: TextEditingController(text: 'Flutter Developer'),
                      style: TextStyle(
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          'Bio',
                          style: TextStyle(
                            color: Color(0xff79869F),
                          ),
                        ),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Personal Information Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2A70C8),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton1(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    height: Get.height / 16,
                    width: Get.width / 1.2,
                    color: Color(0xff2A70C8),
                    textStyle:
                        TextStyle(color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w800),
                    text: 'Save',
                    onPressed: () async {
                      Get.back();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.img = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.img = File(pickedFile.path);
      });
    }
  }
}
