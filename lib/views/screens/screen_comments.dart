import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:paulineife_user/controller/registration_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

import '../../helpers/audio manager.dart';
import '../../helpers/audio_widget.dart';

const url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';

class CommentsScreen extends StatefulWidget {
  CommentsScreen({Key? key, required this.COntroller}) : super(key: key);
  var COntroller;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  var controller = Get.put(RegistrationController());
  late AudioPlayerManager manager;
  var _isShowingWidgetOutline = false;
  var _labelLocation = TimeLabelLocation.below;
  var _labelType = TimeLabelType.totalTime;
  TextStyle? _labelStyle;
  var _thumbRadius = 10.0;
  var _labelPadding = 0.0;
  var _barHeight = 5.0;
  var _barCapShape = BarCapShape.round;
  Color? _baseBarColor;
  Color? _progressBarColor;
  Color? _bufferedBarColor;
  Color? _thumbColor;
  Color? _thumbGlowColor;
  var _thumbCanPaintOutsideBar = true;

  @override
  void initState() {
    super.initState();
    manager = AudioPlayerManager();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Comments'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
                widget.COntroller.play();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Divider(
                        thickness: 1,
                        color: Color(0xffE2E4EB),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5.sp, top: 10.sp),
                            child: CircleAvatar(
                              radius: 20.sp,
                              backgroundImage:
                                  AssetImage('assets/images/12.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.sp),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 3.5.w),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: 'Asad . ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'DMSansR',
                                            color: Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' 5h ago',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'DMSans-Bold',
                                                color: Color(0xff97A1B4),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.sp, right: 10.sp),
                                      width: 65.w,
                                      child: index == 2
                                          ? Container(
                                        width: 20.w,
                                              child:FullExample(audioPlayerManager: manager),)
                                          : Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac hendrerit leo.',
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontFamily: 'DMSansR'),
                                              textAlign: TextAlign.justify,
                                            ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.more_vert,
                                      color: Color(0xff97A1B4),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.sp),
                                      child: Obx(() {
                                        return IconButton(
                                          onPressed: () {
                                            controller.liked.value =
                                                !controller.liked.value;
                                            controller.update();
                                          },
                                          icon: Icon(
                                            controller.liked.value == true
                                                ? Icons.favorite_outlined
                                                : Icons.favorite_outline,
                                            color:
                                                controller.liked.value == true
                                                    ? Colors.red
                                                    : Colors.grey,
                                          ),
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 4.6,
                          ),
                          Text(
                            '22 Likes',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff79869F)),
                          ),
                          SizedBox(
                            width: 8.sp,
                          ),
                          Text(
                            'Reply',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff79869F)),
                          ),
                        ],
                      ),
                      index == 2
                          ? ExpansionTile(
                              trailing: SizedBox(),
                              expandedAlignment: Alignment.centerRight,
                              title: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4.6,
                                  ),
                                  Text(
                                    'View 6 Replies',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Color(0xff2A70C8),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Color(0xff2A70C8),
                                  )
                                ],
                              ),
                              children: [
                                Container(
                                  width: Get.width / 1.2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 5.sp, top: 10.sp),
                                        child: CircleAvatar(
                                          radius: 20.sp,
                                          backgroundImage: AssetImage(
                                              'assets/images/12.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.sp),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.5.w),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: 'Asad . ',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'DMSansR',
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' 5h ago',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'DMSans-Bold',
                                                            color: Color(
                                                                0xff97A1B4),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.sp,
                                                      right: 10.sp),
                                                  width: 50.w,
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac hendrerit leo.',
                                                    style: TextStyle(
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                        fontFamily: 'DMSansR'),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.more_vert,
                                                  color: Color(0xff97A1B4),
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.sp),
                                                  child: Obx(() {
                                                    return IconButton(
                                                      onPressed: () {
                                                        controller.liked.value =
                                                            !controller
                                                                .liked.value;
                                                        controller.update();
                                                      },
                                                      icon: Icon(
                                                        controller.liked
                                                                    .value ==
                                                                true
                                                            ? Icons
                                                                .favorite_outlined
                                                            : Icons
                                                                .favorite_outline,
                                                        color: controller.liked
                                                                    .value ==
                                                                true
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    );
                                                  }),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width / 1.2,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width / 4.6,
                                      ),
                                      Text(
                                        '22 Likes',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff79869F)),
                                      ),
                                      SizedBox(
                                        width: 8.sp,
                                      ),
                                      Text(
                                        'Reply',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff79869F)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width / 1.2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 5.sp, top: 10.sp),
                                        child: CircleAvatar(
                                          radius: 20.sp,
                                          backgroundImage: AssetImage(
                                              'assets/images/12.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.sp),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.5.w),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: 'Asad . ',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'DMSansR',
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' 5h ago',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'DMSans-Bold',
                                                            color: Color(
                                                                0xff97A1B4),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.sp,
                                                      right: 10.sp),
                                                  width: 50.w,
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac hendrerit leo.',
                                                    style: TextStyle(
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                        fontFamily: 'DMSansR'),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.more_vert,
                                                  color: Color(0xff97A1B4),
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.sp),
                                                  child: Obx(() {
                                                    return IconButton(
                                                      onPressed: () {
                                                        controller.liked.value =
                                                            !controller
                                                                .liked.value;
                                                        controller.update();
                                                      },
                                                      icon: Icon(
                                                        controller.liked
                                                                    .value ==
                                                                true
                                                            ? Icons
                                                                .favorite_outlined
                                                            : Icons
                                                                .favorite_outline,
                                                        color: controller.liked
                                                                    .value ==
                                                                true
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    );
                                                  }),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width / 1.2,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width / 4.6,
                                      ),
                                      Text(
                                        '22 Likes',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff79869F)),
                                      ),
                                      SizedBox(
                                        width: 8.sp,
                                      ),
                                      Text(
                                        'Reply',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff79869F)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width / 1.2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 5.sp, top: 10.sp),
                                        child: CircleAvatar(
                                          radius: 20.sp,
                                          backgroundImage: AssetImage(
                                              'assets/images/12.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.sp),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.5.w),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: 'Asad . ',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'DMSansR',
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' 5h ago',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'DMSans-Bold',
                                                            color: Color(
                                                                0xff97A1B4),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.sp,
                                                      right: 10.sp),
                                                  width: 50.w,
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac hendrerit leo.',
                                                    style: TextStyle(
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                        fontFamily: 'DMSansR'),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.more_vert,
                                                  color: Color(0xff97A1B4),
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.sp),
                                                  child: Obx(() {
                                                    return IconButton(
                                                      onPressed: () {
                                                        controller.liked.value =
                                                            !controller
                                                                .liked.value;
                                                        controller.update();
                                                      },
                                                      icon: Icon(
                                                        controller.liked
                                                                    .value ==
                                                                true
                                                            ? Icons
                                                                .favorite_outlined
                                                            : Icons
                                                                .favorite_outline,
                                                        color: controller.liked
                                                                    .value ==
                                                                true
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    );
                                                  }),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width / 1.2,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width / 4.6,
                                      ),
                                      Text(
                                        '22 Likes',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff79869F)),
                                      ),
                                      SizedBox(
                                        width: 8.sp,
                                      ),
                                      Text(
                                        'Reply',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff79869F)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: Get.height / 15,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    margin: EdgeInsets.only(bottom: 5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffE2E4EB)),
                    child: TextFormField(
                      controller:
                          TextEditingController(text: 'Comment as  Ronaldo'),
                      style: TextStyle(fontSize: 16, color: Color(0xff9C9EB9)),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        // prefixIconConstraints: BoxConstraints(
                        //   maxWidth: 150,
                        //   minWidth: 50
                        // ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/svgs/imoj.svg',
                            height: 20.sp,
                            width: 20.sp,
                            color: Color(0xff79869F),
                          ),
                          iconSize: 20.sp,
                        ),
                        suffixIcon: Container(
                          padding: EdgeInsets.only(right: 5.sp),
                          width: 50.sp,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Post',
                                style: TextStyle(
                                    color: Color(0xff2A70C8),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 13.0,
                        ),
                        hintText: '',

                        hintStyle: TextStyle(
                          color: Color(0xff79869F),
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.sp),
                  child: SocialMediaRecorder(
                    sendRequestFunction: (soundFile) {},
                    backGroundColor: Colors.transparent,
                    encode: AudioEncoderType.AAC,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
