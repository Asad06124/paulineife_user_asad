import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:paulineife_user/widgets/custom_input_field1.dart';
import 'package:sizer/sizer.dart';
import 'package:video_trimmer/video_trimmer.dart';
import '../../controller/registration_controller.dart';
import '../../helpers/theme.dart';



class PostVideoScreen extends StatefulWidget {
  PostVideoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PostVideoScreen> createState() => _PostVideoScreenState();
}

class _PostVideoScreenState extends State<PostVideoScreen> {
  var controller = Get.put(RegistrationController());

  Trimmer _trimmer = Trimmer();

  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  @override
  void initState() {
    super.initState();
    _trimmer;
    _loadVideo();
  }

  void _loadVideo() {
    _trimmer.loadVideo(videoFile: controller.vid!);
  }

  _saveVideo() {
    setState(() {
      _progressVisibility = true;
    });

    _trimmer.saveTrimmedVideo(
      startValue: _startValue,
      endValue: _endValue,
      onSave: (outputPath) {
        setState(() {
          _progressVisibility = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool swtch = true;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (Navigator.of(context).userGestureInProgress) {
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Create Post'),
            centerTitle: true,
            actions: [
              CustomButton1(
                text: 'Post',
                textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.white),
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
          backgroundColor: Themes.setColor(context) ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.chat_bubble,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 6.sp,
                      ),
                      Text(
                        'Allow Comments',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
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
                Stack(children: [
                  Container(
                    height: 50.h,
                    width: Get.width,
                    child: VideoViewer(trimmer: _trimmer),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: TextButton(
                      child: _isPlaying
                          ? const Icon(
                              Icons.pause,
                              size: 80.0,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              size: 80.0,
                              color: Colors.white,
                            ),
                      onPressed: () async {
                        bool playbackState = await _trimmer.videPlaybackControl(
                          startValue: _startValue,
                          endValue: _endValue,
                        );
                        setState(() => _isPlaying = playbackState);
                      },
                    ),
                  ),
                ]),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  child: CustomInputField1(
                    textAlign: TextAlign.start,
                    hint: 'Add a caption',
                    maxLines: 5,
                    minLines: 1,
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Container(
                    color: Colors.black,
                    width: Get.width,
                    child: TrimEditor(
                      trimmer: _trimmer,
                      viewerHeight: 50,
                      viewerWidth: Get.width,
                      showDuration: false,
                      maxVideoLength: Duration(seconds: _trimmer.videoPlayerController!.value.duration.inSeconds - 10),
                      onChangeStart: (value) => _startValue = value,
                      onChangeEnd: (value) => _endValue = value,
                      onChangePlaybackState: (value) => setState(() => _isPlaying = value),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
