import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/helpers/helpers.dart';
import 'package:paulineife_user/widgets/status_view_custom.dart';
import 'package:sizer/sizer.dart';

import '../constant/constant.dart';
import '../helpers/theme_service.dart';
import '../models/api/PostModel.dart';
import '../views/screens/screen_story_view.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.story,
  }) : super(key: key);
  final Post story;

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
              Get.to(StoryViewScreen(
                storiesList: story.isThread ? story.asThread.childPosts : [story],
                timestamp: DateTime.now(),
                username: story.username, userImage: userPlaceholder,
              ));
            },
            radius: 25.sp,
            spacing: 8.sp,
            strokeWidth: 2,
            indexOfSeenStatus: 1,
            numberOfStatus: 1,
            padding: 4,
            type: 'story',
            centerImageUrl: "$domainUrlWithProtocol${story.userImage}",
            seenColor: Color(0xff3AA0FF),
            unSeenColor: Colors.red,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: Get.width * .2,
            child: AutoSizeText(
              story.username,
              maxLines: 1,
              minFontSize: 14,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                fontSize: font12,
                fontWeight: FontWeight5,
                fontFamily: fontFamilyD,
              ),
            ),
          ),
        )
      ],
    );
  }
}
