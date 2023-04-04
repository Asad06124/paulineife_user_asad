import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/widgets/status_view_custom.dart';
import 'package:sizer/sizer.dart';

import '../constant/constant.dart';
import '../helpers/theme_service.dart';
import '../models/api/HomeResponse.dart';
import '../views/screens/screen_story_view.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key, required this.story,
  }) : super(key: key);
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 1.sp,
            bottom: 2.sp,
            left: 4.sp,
            right: 4.sp,
          ),
          child: StatusViewCustom(
            onTap: () {
              Get.to(StoryViewScreen());
            },
            radius: 25.sp,
            spacing: 8.sp,
            strokeWidth: 2,
            indexOfSeenStatus: 1,
            numberOfStatus: 1,
            padding: 4,
            type: 'story',
            centerImageUrl: story.image!,
            seenColor: Color(0xff3AA0FF),
            unSeenColor: Colors.red,
          ),
        ),
        Text(
          'Asad',
          style: TextStyle(
            color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
            fontSize: font12,
            fontWeight: FontWeight5,
            fontFamily: fontFamilyD,
          ),
        )
      ],
    );
  }
}
