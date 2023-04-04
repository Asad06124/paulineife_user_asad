import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/home_controller.dart';
import 'package:paulineife_user/models/api/HomeResponse.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';
import 'package:paulineife_user/views/screens/screen_search_profile.dart';
import 'package:paulineife_user/views/screens/screen_story_view.dart';
import 'package:sizer/sizer.dart';

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
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2A70C8),
                  fontFamily: 'ubuntu'),
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
                      color: ThemeService.isSavedDarkMode()
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                  position: BadgePosition.topEnd(end: -7, top: -13),
                  child: SvgPicture.asset("assets/svgs/email.svg"),
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor:
              ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        ),
        backgroundColor:
            ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: size.width / 1.08,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.stories.value.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CameraCard();
                    } else {
                      Story story = controller.stories.value[index - 1];
                      return ProfileCard(
                        story: story,
                      );
                    }
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
                      child: Obx(() {
                        ImageProvider<Object>? imageProvider;
                        if (controller.posts.value.first != null &&
                            controller.posts.value.first.image
                                is ImageProvider) {
                          imageProvider = controller.posts.value.first.image
                              as ImageProvider<Object>?;
                        } else {
                          imageProvider = AssetImage('assets/images/post.png');
                        }
                        return Container(
                          height: size.height / 1.8 + 15,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            image: DecorationImage(
                              image: imageProvider!,
                              fit: BoxFit.cover,
                            ),
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
                                            color:
                                                ThemeService.isSavedDarkMode()
                                                    ? Colors.white
                                                    : Colors.white,
                                          )),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/images/12.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Asad Ullah',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                ThemeService.isSavedDarkMode()
                                                    ? Colors.white
                                                    : Colors.white,
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
                                            color:
                                                ThemeService.isSavedDarkMode()
                                                    ? Colors.white
                                                    : Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                            child:
                                SvgPicture.asset('assets/images/repeat.svg')),
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
}
