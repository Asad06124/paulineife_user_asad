import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/comments_controller.dart';
import 'package:paulineife_user/controller/home_controller.dart';
import 'package:paulineife_user/models/api/CommentResponse.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';

import '../../helpers/social_media_recorder/screen/social_media_recorder.dart';
import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';
import '../../test_audio.dart';

const url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-12.mp3';

class CommentsScreen extends StatelessWidget {
  String postId;

  var controller = Get.put(HomeController());
  var selectedUserName = ''.obs;
  var selectedCommentId = 0;

  @override
  Widget build(BuildContext context) {
    var commentsController = Get.put(CommentsController(postId: postId), tag: postId);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          title: Obx(() {
            return Text(
              '${commentsController.comments.length} Comments',
              style: getAppbarTextTheme(),
            );
          }),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
              )),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                return commentsController.loading.isTrue
                    ? Center(
                  child: Text("Loading Comments..."),
                )
                    : ListView.builder(
                  itemCount: commentsController.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    var comment = commentsController.comments[index];

                    return _getCommentWidget(comment);
                  },
                );
              }),
            ),
            Obx(() {
              return Column(
                children: [
                  if (selectedUserName.isNotEmpty)
                    Text("Replying to ${selectedUserName.value}"),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          margin: EdgeInsets.only(bottom: 5.sp, left: 5.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50), color: ThemeService.isSavedDarkMode() ? Color(0xff3d3d3d) : Color(0xffE2E4EB)),
                          child: TextFormField(
                            style: TextStyle(fontSize: 16, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff9C9EB9)),
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
                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
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
                                          color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff2A70C8),
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                              contentPadding: EdgeInsets.only(
                                top: 13.0,
                              ),
                              hintText: 'Comment as Ronaldo',
                              hintStyle: TextStyle(
                                color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F),
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
                          recordIcon: Icon(Icons.mic, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                          sendRequestFunction: (soundFile) {},
                          backGroundColor: Colors.transparent,
                          encode: AudioEncoderType.AAC,
                        ),
                      )
                    ],
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  CommentsScreen({
    required this.postId,
  });

  Widget _getCommentWidget(Comment comment, {bool isReplyWidget = false}) {
    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Divider(
            thickness: 1,
            color: Color(0xffE2E4EB),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: (isReplyWidget ? 3 : 5).sp, top: (isReplyWidget ? 3 : 5).sp),
                child: CircleAvatar(
                  radius: (isReplyWidget ? 13 : 20).sp,
                  backgroundImage: AssetImage('assets/images/12.png'),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.5.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Asad  . ",
                            style: TextStyle(
                                fontSize: (isReplyWidget ? 13 : 14),
                                fontWeight: FontWeight.w700,
                                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                            children: [
                              TextSpan(
                                text: "Just now",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff97A1B4),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                        width: (isReplyWidget ? 55 : 65).w,
                        child: (comment.voice != null && comment.voice!.isNotEmpty)
                            ? Container(
                          width: (isReplyWidget ? 15 : 20).w,
                          child: ItemAudioPlay(
                            url: comment.getVoice,
                          ),
                        )
                            : Text(
                          comment.comment,
                          style: TextStyle(
                            fontSize: (isReplyWidget ? 8 : 9).sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                          ),
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
                              controller.liked.value = !controller.liked.value;
                              controller.update();
                            },
                            icon: Icon(
                              controller.liked.value == true ? Icons.favorite_outlined : Icons.favorite_outline,
                              color: controller.liked.value == true ? Colors.red : Colors.grey,
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ],
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
                style:
                TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F)),
              ),
              SizedBox(
                width: 8.sp,
              ),
              if (!isReplyWidget)
                TextButton(onPressed: (){
                  selectedUserName.value = 'Asad';
                }, child: Text(
                  'Reply',
                  style:
                  TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff79869F)),
                )),
            ],
          ),
          comment.replies.isNotEmpty
              ? ExpansionTile(
            shape: Border(),
            expandedAlignment: Alignment.centerRight,
            title: Row(
              children: [
                SizedBox(
                  width: Get.width / 4.6,
                ),
                Text(
                  'View ${comment.replies.length} Replies',
                  style: TextStyle(fontSize: 9.sp, color: Color(0xff2A70C8), fontWeight: FontWeight.w500),
                ),
              ],
            ),
            children: comment.replies.map((e) => Container(child: _getCommentWidget(e, isReplyWidget: true))).toList(),
          )
              : SizedBox(),
        ],
      ),
    );
  }
}
