import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paulineife_user/controller/home_controller.dart';
import 'package:paulineife_user/extensions/cap_extension.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../helpers/theme_service.dart';
import '../../widgets/camera_card.dart';
import '../../widgets/profile_card.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  CameraCard(),
                  ...controller.stories.value
                      .map((e) => ProfileCard(
                            story: e,
                          ))
                      .toList(),
                ],
              ),




              Expanded(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.posts.value.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            Get.to(StoryViewScreen(storiesList: controller.posts.value,));
                          },
                          child: Builder(builder: (_) {
                            Widget content;
                            if (controller.posts.value.first.image != null) {
                              // Show image
                              content = CachedNetworkImage(
                                imageUrl: controller.posts.value.first.image!,
                                height: size.height / 1.8 + 15,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: size.height / 1.8 + 15,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.grey[300],
                                  ),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: size.height / 1.8 + 15,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.grey[300],
                                  ),
                                  child: Icon(Icons.error),
                                ),
                              );

                            } else if (controller.posts.value.first.video != null) {
                              final String videoUrl = controller.posts.value.first.video!;
                              content = FutureBuilder<File>(
                                future: getVideoThumbnail(videoUrl),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                    final thumbnailFile = snapshot.data!;

                                    return Container(
                                      height: size.height / 1.8 + 15,
                                      alignment: Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.sp),
                                        image: DecorationImage(
                                          image: FileImage(thumbnailFile),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(ProfileScreen(username: "",));
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Icon(
                                                    Icons.play_circle_fill,
                                                    size: 50.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Row(
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
                                                        ),
                                                      ),
                                                      child: CircleAvatar(
                                                        backgroundImage: CachedNetworkImageProvider(
                                                          controller.posts.value.first.userImage,
                                                        ),
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
                                                          controller.posts.value.first.username,
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
                                                          controller.posts.value.first.timestamp.toRelativeTime,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    // Show placeholder while loading thumbnail
                                    return Container(
                                      height: size.height / 1.8 + 15,
                                      alignment: Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.sp),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                },
                              );
                            } else {
// Show text
                              content = Container(
                                height: size.height / 1.8 + 15,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Colors.grey[300],
                                ),
                                child: Text(
                                  controller.posts.value.first.caption,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }
                            return Stack(
                              children: [
                                content,
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(ProfileScreen(username: '',));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.sp),
                                          bottomRight: Radius.circular(10.sp),
                                        )
                                      ),
                                      width: Get.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 40.sp,
                                              width: 40.sp,
                                              padding: EdgeInsets.all(2.sp),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage: CachedNetworkImageProvider(
                                                  controller.posts.value.first.userImage,
                                                ),
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
                                                  controller.posts.value.first.username,
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
                                                  controller.posts.value.first.timestamp.toRelativeTime,
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
                              ],
                            );
                          }),
                        )
                      else
                        Center(
                          child: NotFound(
                            message: "No posts",
                            showImage: true,
                            color: Colors.blue.shade900,
                          ),
                        ),
                    ],
                  );
                }),
              ),





              SizedBox(
                height: size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.fetchRefreshPost();
                    },
                    child: SvgPicture.asset('assets/images/refresh.svg'),
                  ),
                  GestureDetector(
                      onTap: () {
                        controller.fetchRandomPost();
                      },
                      child: SvgPicture.asset('assets/images/repeat.svg')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<File> getVideoThumbnail (String url) async {

    var thumbTempPath = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75, // you can change the thumbnail quality here
    );
    return File(thumbTempPath!);
  }
}
