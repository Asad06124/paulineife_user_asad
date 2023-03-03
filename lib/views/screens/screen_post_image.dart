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

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';

class PostImageScreen extends StatelessWidget {
  PostImageScreen({Key? key, required this.isnormal}) : super(key: key);
  var controller = Get.put(RegistrationController());
  var isnormal;

  @override
  Widget build(BuildContext context) {
    int a = 0;
    bool swtch = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
          centerTitle: true,
          actions: [
            CustomButton1(
              text: 'Post',
              textStyle: getAppbarTextTheme().copyWith(fontSize: 12.sp),
              onPressed: () {
                Get.to(HomeScreen());
              },
              color: Color(0xff2A70C8),
              height: 35.sp,
              width: 60.sp,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ],
          toolbarHeight: 65.sp,
        ),
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: GetBuilder<RegistrationController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.chat_bubble,
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
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
                          color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,                        ),
                      ),
                      Spacer(),
                      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
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
                  padding: EdgeInsets.all(10.sp),
                  height: 53.5.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(controller.images[a]), fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      controller.images.length > 2
                          ? GestureDetector(
                              onTap: () {
                                controller.images.removeAt(a);
                                controller.update();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/svgs/delete.svg',
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                Visibility(
                  visible: isnormal,
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: CustomInputField1(
                      hint: 'Add a caption',
                      maxLines: 5,
                      minLines: 1,
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                    ),
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return Container(
                      height: 75.sp,
                      child: ListView.builder(
                        itemCount: controller.images.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.update();
                                a = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(8.sp),
                              alignment: Alignment.center,
                              height: 70.sp,
                              width: 50.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black      ,                          image: DecorationImage(
                                    image: FileImage(
                                      controller.images[index],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.sp,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
