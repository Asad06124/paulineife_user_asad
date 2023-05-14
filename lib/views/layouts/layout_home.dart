import 'dart:developer';
import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/constant/constant.dart';
import 'package:paulineife_user/controller/home_controller.dart';
import 'package:paulineife_user/extensions/cap_extension.dart';
import 'package:paulineife_user/helpers/helpers.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../helpers/theme_service.dart';
import '../../widgets/camera_card.dart';
import '../../widgets/profile_card.dart';

class HomeLayout extends StatefulWidget {
  Function(StoryType type) onStoryPressed;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();

  HomeLayout({
    required this.onStoryPressed,
  });
}

class _HomeLayoutState extends State<HomeLayout> {
  var controller = Get.put(HomeController());
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
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
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () => controller.fetchRefreshPost(),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              children: [
                Obx(() {
                  return Row(
                    children: [
                      CameraCard(
                        onStoryPressed: widget.onStoryPressed,
                      ),
                      ...controller.stories.value
                          .map((e) =>
                          ProfileCard(
                            story: e,
                          ))
                          .toList(),
                    ],
                  );
                }),
                Expanded(
                  child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (controller.posts.value.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              var firstPost = controller.posts.value.first;
                              var posts;
                              if (firstPost.isThread) {
                                posts = firstPost.asThread.childPosts.skip(1).toList();
                              } else {
                                posts = [firstPost];
                              }

                              Get.to(StoryViewScreen(
                                storiesList: posts,
                                userImage: firstPost.userImage,
                                username: firstPost.username,
                                timestamp: controller.posts.value.first.timestamp,
                              ));
                            },
                            child: Builder(builder: (_) {
                              var firstPost = controller.posts.value.first;
                              var image = firstPost.getImage;
                              var video = firstPost.getVideo;

                              log(firstPost.toJson().toString());

                              Widget content;
                              if (image != null && (video == null || video.isEmpty)) {
                                var imageData;
                                try {
                                  imageData = image.toString();
                                } catch (e) {
                                  imageData = null;
                                }

                                content = Container(
                                  height: size.height / 1.8 + 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.sp),
                                      image: DecorationImage(
                                        image: image.isNotEmpty && imageData != null
                                            ? ExtendedNetworkImageProvider(imageData)
                                            : ExtendedNetworkImageProvider(placeholderUrl) as ImageProvider,
                                        fit: BoxFit.cover,
                                      )),
                                );

                                // content = image.isNotEmpty && imageData != null
                                //     ? Image.memory(
                                //         imageData,
                                //         height: size.height / 1.8 + 15,
                                //         width: double.infinity,
                                //         fit: BoxFit.cover,
                                //       )
                                //     : CachedNetworkImage(
                                //         imageUrl: placeholderUrl,
                                //         height: size.height / 1.8 + 15,
                                //         width: double.infinity,
                                //         fit: BoxFit.cover,
                                //       );
                              } else if (video != null && video.isNotEmpty) {
                                final String videoUrl = video;
                                print(videoUrl);

                                content = FutureBuilder<Uint8List>(
                                  future: getVideoThumbnail(videoUrl),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState != ConnectionState.waiting) {
                                      final thumbnailData = snapshot.data;

                                      return Container(
                                        height: size.height / 1.8 + 15,
                                        alignment: Alignment.bottomLeft,
                                        decoration: thumbnailData != null ? BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.sp),
                                          image: DecorationImage(
                                            image: MemoryImage(thumbnailData),
                                            fit: BoxFit.cover,
                                          ),
                                        ) : BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.sp),
                                            color: getThemeBlack
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(StoryViewScreen(
                                              storiesList: [firstPost],
                                              userImage: firstPost.userImage,
                                              username: firstPost.username,
                                              timestamp: controller.posts.value.first.timestamp,
                                            ));
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
                                                            "$domainUrlWithProtocol${firstPost.userImage}",
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
                                        Get.to(ProfileScreen(
                                          username: firstPost.username,
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(.5),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.sp),
                                              bottomRight: Radius.circular(10.sp),
                                            )),
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
                                                    "$domainUrlWithProtocol${firstPost.userImage}",
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
                                                    firstPost.username,
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
                                                    firstPost.timestamp.toRelativeTime,
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
                        _refreshIndicatorKey.currentState?.show();
                      },
                      child: SvgPicture.asset('assets/images/refresh.svg'),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.fetchRandomPost;
                        },
                        child: SvgPicture.asset('assets/images/repeat.svg')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Uint8List> getVideoThumbnail(String url) async {
    var thumbTempData = await VideoThumbnail.thumbnailData(
      video: url,
      // thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 64,
      // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75, // you can change the thumbnail quality here
    ).catchError((e) {
      print(e);
    }).onError((error, stackTrace) {
      print(error);
    });
    print(thumbTempData);
    return thumbTempData!;
  }
}

enum StoryType { gallery, camera }
