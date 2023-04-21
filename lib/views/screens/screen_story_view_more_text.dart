import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_top_panel/sliding_top_panel.dart';

import '../../helpers/theme_service.dart';

class StoryTextViewScreen extends StatelessWidget {
  SlidingPanelTopController strl;

  String text;
  String username, userImage;

  @override
  Widget build(BuildContext context) {

    print(text);
    print(username);
    print(userImage);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10.sp),
              leading: Container(
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.sp,
                      color: Color(0xff2A70C8),
                    )),
                child: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage: ExtendedNetworkImageProvider(userImage),
                ),
              ),
              title: Text(
                username,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Color(0xff97A1B4),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 80.h,
                child: AutoSizeText(
                  text,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 40,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 40.sp),
          child: FloatingActionButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            onPressed: () {
              Get.back();
              strl.toggle();
              strl.close();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
              size: 30.sp,
            ),
            backgroundColor: Color(0xff3D3D3D),
          ),
        ),
      ),
    );
  }

  StoryTextViewScreen({
    required this.strl,
    required this.text,
    required this.username,
    required this.userImage,
  });
}
