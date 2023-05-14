import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/home_controller.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/widgets/custom_buttom.dart';
import 'package:sizer/sizer.dart';
import 'package:video_editor/domain/bloc/controller.dart';
import 'package:video_editor/ui/trim/trim_slider.dart';
import 'package:video_editor/ui/video_viewer.dart';

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';

class PostVideoScreen extends StatefulWidget {
  PostVideoScreen({
    Key? key,
  }) : super(key: key);
  var controller = Get.put(HomeController());

  @override
  State<PostVideoScreen> createState() => _PostVideoScreenState();
}

class _PostVideoScreenState extends State<PostVideoScreen> {
  // var controller = Get.put(RegistrationController());
  //
  // Trimmer _trimmer = Trimmer();
  //
  // double _startValue = 0.0;
  // double _endValue = 0.0;
  //
  // bool _isPlaying = false;
  // bool _progressVisibility = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _trimmer;
  //   _loadVideo();
  // }
  //
  // void _loadVideo() {
  //   _trimmer.loadVideo(videoFile: controller.vid!);
  // }

  final double height = 60;
  bool button = false;

  late VideoEditorController _controller;

  String caption = "";
  File? file;

  @override
  void initState() {
    _controller = VideoEditorController.file(widget.controller.vid!, maxDuration: Duration(seconds: 120))
      ..initialize(aspectRatio: 16 / 16).then((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Sze = MediaQuery.of(context).size;
    bool swtch = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          title: Text(
            'Create Post',
            style: getAppbarTextTheme(),
          ),
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
            CustomButton1(
              text: 'Post',
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.white,
              ),
              onPressed: () {
                Get.find<HomeController>().uploadNormalVideo(caption, widget.controller.vid!);
              },
              color: Color(0xff2A70C8),
              height: 35.sp,
              width: 60.sp,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ],
          toolbarHeight: 65.sp,
        ),
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
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
                      color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                    ),
                    SizedBox(
                      width: 6.sp,
                    ),
                    Text(
                      'Allow Comments',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                      ),
                    ),
                    Spacer(),
                    StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                      return Switch(
                          activeColor: ThemeService.isSavedDarkMode() ? Colors.white : Color(0xff3AA0FF),
                          activeTrackColor: ThemeService.isSavedDarkMode() ? Color(0xff3d3d3d) : Color(0xffD5EBFF),
                          inactiveTrackColor: ThemeService.isSavedDarkMode() ? Colors.grey : Color(0xffD5EBFF),
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
              // Stack(children: [
              //   Container(
              //     height: 50.h,
              //     width: Get.width,
              //     child: VideoViewer(trimmer: _trimmer),
              //   ),
              //   Positioned(
              //     top: 0,
              //     bottom: 0,
              //     left: 0,
              //     right: 0,
              //     child: TextButton(
              //       child: _isPlaying
              //           ? Icon(
              //               Icons.pause,
              //               size: 80.0,
              //               color: ThemeService.isSavedDarkMode()
              //                   ? Colors.black
              //                   : Colors.white,
              //             )
              //           : Icon(
              //               Icons.play_arrow,
              //               size: 80.0,
              //               color: ThemeService.isSavedDarkMode()
              //                   ? Colors.black
              //                   : Colors.white,
              //             ),
              //       onPressed: () async {
              //         bool playbackState = await _trimmer.videPlaybackControl(
              //           startValue: _startValue,
              //           endValue: _endValue,
              //         );
              //         setState(() => _isPlaying = playbackState);
              //       },
              //     ),
              //   ),
              // ]),
              // Container(
              //   padding: EdgeInsets.all(10.sp),
              //   child: CustomInputField1(
              //     textStyle: TextStyle(
              //       color: ThemeService.isSavedDarkMode()
              //           ? Colors.white
              //           : Colors.black,
              //     ),
              //     textAlign: TextAlign.start,
              //     hint: 'Add a caption',
              //     hintStyle: TextStyle(color: Color(0xff666666)),
              //     maxLines: 5,
              //     minLines: 1,
              //     contentPadding: EdgeInsets.only(left: 5, right: 5),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 10.sp, right:10.sp, bottom: 8),
              //   child: Container(
              //     color: ThemeService.isSavedDarkMode()
              //         ? Colors.white
              //         : Colors.black,
              //     width: Get.width,
              //     child: TrimEditor(
              //       trimmer: _trimmer,
              //       viewerHeight: 50,
              //       scrubberWidth: 10.sp,
              //       viewerWidth: Get.width,
              //       showDuration: false,
              //       maxVideoLength: Duration(
              //           seconds: _trimmer.videoPlayerController!.value.duration
              //                   .inSeconds -
              //               10),
              //       onChangeStart: (value) => _startValue = value,
              //       onChangeEnd: (value) => _endValue = value,
              //       onChangePlaybackState: (value) =>
              //           setState(() => _isPlaying = value),
              //       circleSize: 10.sp,
              //       circlePaintColor: Colors.red,
              //       borderPaintColor: Colors.red,
              //     ),
              //   ),
              // ),

              // Expanded(
              //     child: DefaultTabController(
              //         length: 2,
              //         child: Column(children: [
              //           Expanded(
              //               child: TabBarView(
              //                 physics: const NeverScrollableScrollPhysics(),
              //                 children: [
              //                   Stack(alignment: Alignment.center, children: [
              //                     // CropGridViewer(
              //                     //   controller: _controller,
              //                     //   showGrid: false,
              //                     // ),
              //                     AnimatedBuilder(
              //                       animation: _controller.video,
              //                       builder: (_, __) => OpacityTransition(
              //                         visible: !_controller.isPlaying,
              //                         child: GestureDetector(
              //                           onTap: _controller.video.play,
              //                           child: Container(
              //                             width: 100,
              //                             height: 100,
              //                             decoration: const BoxDecoration(
              //                               color: Colors.transparent,
              //                               shape: BoxShape.circle,
              //                             ),
              //                             child: const Icon(
              //                               Icons.play_arrow,
              //                               color: Colors.white,
              //                               size: 100,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ]),
              //                   CoverViewer(controller: _controller)
              //                 ],
              //               )),
              //           Container(
              //               height: 200,
              //               margin: const EdgeInsets.only(top: 10),
              //               child: Column(children: [
              //                 Expanded(
              //                   child: TabBarView(
              //                     children: [
              //
              //                       Column(
              //                           mainAxisAlignment:
              //                           MainAxisAlignment.center,
              //                           children: [_coverSelection()]),
              //                     ],
              //                   ),
              //                 )
              //               ])),
              //           _customSnackBar(),
              //           ValueListenableBuilder(
              //             valueListenable: _isExporting,
              //             builder: (_, bool export, __) => OpacityTransition(
              //               visible: export,
              //               child: AlertDialog(
              //                 backgroundColor: Colors.white,
              //                 title: ValueListenableBuilder(
              //                   valueListenable: _exportingProgress,
              //                   builder: (_, double value, __) => Text(
              //                     "Exporting video ${(value * 100).ceil()}%",
              //                     style: const TextStyle(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 14,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ]))),
              _controller.initialized
                  ? Container(
                      height: Sze.height * 0.70,
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: _controller.video,
                            builder: (_, __) => GestureDetector(
                              onTap: _controller.isPlaying ? _controller.video.pause : _controller.video.play,
                              child: Container(
                                child: Container(
                                  height: 50.h,
                                  width: Get.width,
                                  child: VideoViewer(
                                    controller: _controller,
                                  ),
                                ),

                                height: Sze.height * 0.49,
                                width: Sze.width,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                // child:  Icon(
                                //   _controller.isPlaying?Icons.pause : Icons.play_arrow,
                                //   color: Colors.black.withOpacity(0.05),
                                //   size: 100,
                                // ),
                              ),
                            ),
                          ),
                          Column(mainAxisAlignment: MainAxisAlignment.center, children: _trimSlider()),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }

  // String formatter(Duration duration) => [
  //   duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
  //   duration.inSeconds.remainder(60).toString().padLeft(2, '0')
  // ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: _controller.video,
        builder: (_, __) {
          final duration = _controller.video.value.duration.inSeconds;
          final pos = _controller.trimPosition * duration;
          final start = _controller.minTrim * duration;
          final end = _controller.maxTrim * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      this.caption = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Add a caption",
                        hintStyle: TextStyle(
                          color: Color(0xff79869F),
                          fontSize: 14,
                        )),
                  ),
                ),
                // Row(children: [
                //   Text(formatter(Duration(seconds: pos.toInt()))),
                //   const Expanded(child: SizedBox()),
                //   OpacityTransition(
                //     visible: _controller.isTrimming,
                //     child: Row(mainAxisSize: MainAxisSize.min, children: [
                //       Text(formatter(Duration(seconds: start.toInt()))),
                //       const SizedBox(width: 10),
                //       Text(formatter(Duration(seconds: end.toInt()))),
                //     ]),
                //   )
                // ]),
              ],
            ),
          );
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: height / 9),
        child: TrimSlider(
          controller: _controller,
          height: height,
          horizontalMargin: height / 4,
          hasHaptic: true,

          // child: TrimTimeline(
          //     controller: _controller,
          //     margin: const EdgeInsets.only(top: 10))
        ),
      ),
    ];
  }
}
