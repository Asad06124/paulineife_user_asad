import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/profile_controller.dart';
import 'package:paulineife_user/views/screens/screen_chat.dart';
import 'package:paulineife_user/views/screens/screen_following.dart';
import 'package:paulineife_user/views/screens/screen_report.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';

import '../../constant/constant.dart';
import '../../helpers/helpers.dart';
import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';

class ProfileScreen extends StatefulWidget {
  String username;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  ProfileScreen({
    required this.username,
  });
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      ProfileController(username: widget.username),
      tag: widget.username,
      // permanent: true,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          title: Obx(() {
            return Text(
              controller.profile.value?.fullName ?? "Full Name",
              style: getAppbarTextTheme().copyWith(fontSize: 12.sp),
            );
          }),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
              )),
          actions: [
            PopupMenuButton(
              color: ThemeService.isSavedDarkMode() ? Color(0xff3D3D3D) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              icon: Icon(
                Icons.more_vert,
                color: Color(0xff97A1B4),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.to(ReportScreen());
                    });
                  },
                  child: Text(
                    'Report',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFF0000),
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Block',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      Obx(() {
                        print(controller.profile.value?.image);

                        var url = domainUrlWithProtocol + (controller.profile.value?.image ?? "null");
                        url = url.endsWith('null') ? userPlaceholder : url;

                        return Container(
                          height: 55.sp,
                          width: 55.sp,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xff3AA0FF), width: 3.sp),
                              image: DecorationImage(image: CachedNetworkImageProvider(url), fit: BoxFit.cover)),
                        );
                      }),
                      SizedBox(
                        width: 5,
                      ),
                      Obx(() {
                        return RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: '${controller.profile.value?.fullName ?? "Full Name"}\n',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                              children: [
                                TextSpan(
                                  text: '@${controller.profile.value?.username ?? "username"}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff2A70C8),
                                  ),
                                )
                              ]),
                        );
                      }),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 10.sp,
                ),
                Obx(() {
                  return RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: '${controller.profile.value?.bio ?? "No bio"}',
                        style: TextStyle(
                            height: 1.sp,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                        children: [
                          TextSpan(
                            text: '\n${controller.profile.value?.website ?? ""}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2A70C8),
                            ),
                          )
                        ]),
                  );
                }),
                SizedBox(
                  height: Get.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    GestureDetector(
                      onTap: () {
                        Get.to(FollowingScreen(
                          username: controller.username,
                          type: 'followers',
                        ));
                      },
                      child: Obx(() {
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: '${controller.profile.value?.numberOfFollowers ?? 0}\n',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Followers',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                                  ),
                                )
                              ]),
                        );
                      }),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(FollowingScreen(
                          username: controller.username,
                          type: 'following',
                        ));
                      },
                      child: Obx(() {
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '${controller.profile.value?.numberOfFollowing ?? 0}\n',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                            children: [
                              TextSpan(
                                text: 'Following',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(),
                  ],
                ),
                Obx(() {
                  return (controller.isLoggedInUser.isFalse)
                      ? Row(
                          children: [
                            Obx(() {
                              return CustomButton1(
                                  text: controller.followed.isTrue ? 'Following' : '+ Follow',
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(10.sp),
                                  // ),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: controller.followed.isTrue ? Colors.black : Colors.white,
                                  ),
                                  elevation: 0,
                                  height: Get.height / 16,
                                  width: Get.width / 2.5,
                                  borderColor: Color(0xff2A70C8),
                                  color: controller.followed.isFalse ? Color(0xff2A70C8) : Colors.white,
                                  onPressed: () {
                                    controller.followOrUnfollowUser();
                                  });
                            }),
                            CustomButton1(
                                text: 'Message',
                                decuration: BoxDecoration(
                                    border: Border.all(color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                                    borderRadius: BorderRadius.circular(10.sp)),
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(10.sp),
                                // ),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                                ),
                                elevation: 0,
                                height: Get.height / 16,
                                width: Get.width / 2.5,
                                color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                                onPressed: controller.profile.value == null
                                    ? null
                                    : () {
                                        Get.to(ChatScreen(
                                          userId: controller.profile.value!.id.toString(),
                                        ));
                                      }),
                          ],
                        )
                      : SizedBox();
                }),
                SizedBox(
                  height: 10.sp,
                ),
                Divider(
                  color: Color(0xffa4a4a4),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Obx(() {
                  print(controller.posts.length);
                  return controller.posts.isNotEmpty
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.posts.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2.sp, mainAxisSpacing: 2.sp),
                          itemBuilder: (BuildContext context, int index) {
                            var post = controller.posts[index];
                            // var url = domainUrlWithProtocol + post.image.toString();
                            // url = url.endsWith('null') ? placeholderUrl : url;
                            print("index $index ${post.getImage}");
                            var data = post.decodeImageFromBase64();

                            if (data == null) {
                              return SizedBox();
                            }

                            return GestureDetector(
                              onTap: () {
                                // _generateRandomNumber();
                                Get.to(StoryViewScreen(
                                  storiesList: post.isThread ? post.asThread.childPosts.skip(1).toList() : [post],
                                  username: post.username,
                                  timestamp: DateTime.now(),
                                  userImage: post.userImage,
                                ));
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                // padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: ExtendedMemoryImageProvider(data), fit: BoxFit.cover),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          width: Get.width,
                                          height: Get.height,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x0),
                                                Color(0xeb000000),
                                              ],
                                              stops: [
                                                0.6,
                                                10.0,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                        )),
                                    // Positioned(
                                    //   top: 2.sp,
                                    //   right: 2.sp,
                                    //   child: Container(
                                    //     margin: EdgeInsets.all(5.sp),
                                    //     height: 20.sp,
                                    //     width: 20.sp,
                                    //     alignment: Alignment.center,
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(
                                    //           4.sp,
                                    //         ),
                                    //         color: Color(0x5effffff)),
                                    //     child: Text(
                                    //       '5',
                                    //       style: TextStyle(
                                    //         color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Positioned(
                                      bottom: 5.sp,
                                      right: 5.sp,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                                            size: 13.sp,
                                          ),
                                          SizedBox(
                                            width: 3.sp,
                                          ),
                                          Text(
                                            post.views.toString(),
                                            style: TextStyle(
                                              color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: fontFamilyD,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : NotFound(message: "No posts yet");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
