import 'package:custom_utils/custom_utils.dart';

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';
import 'package:paulineife_user/views/screens/screen_report.dart';

import '../../../widgets/custom_input_field1.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  // var controller =Get.put(BusinessControllers());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leadingWidth: 20.sp,
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(8.h),
          //   child: Container(
          //     height: 10.h,
          //     alignment: Alignment.center,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 3.w),
          //               child: ClipOval(
          //                   child: SizedBox(
          //                       height: 50.sp,
          //                       width: 50.sp,
          //                       child: Image.asset(
          //                         'assets/images/12.png',
          //                         fit: BoxFit.fill,
          //                       ),),),
          //             ),
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Asad',
          //                   style: TextStyle(
          //                     color: Colors.black,
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 14.sp,
          //                   ),
          //                 ),
          //                 Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     Icon(
          //                       Icons.circle,
          //                       size: 6.sp,
          //                       color: Colors.green,
          //                     ),
          //                     SizedBox(
          //                       width: 2.w,
          //                     ),
          //                     Text(
          //                       'Online',
          //                       style: TextStyle(
          //                         color: hintColor,
          //                         fontWeight: FontWeight.w400,
          //                         fontSize: 11.sp,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //         // Padding(
          //         //   padding: EdgeInsets.only(right: 4.w),
          //         //   child: IconButton(
          //         //       onPressed: () {},
          //         //       icon: Icon(
          //         //         Icons.search,
          //         //         color: greenC,
          //         //       )),
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/12.png',
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Asad',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      color: hintColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          foregroundColor: Colors.black,
          actions: [
            PopupMenuButton(
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
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        ),
                  ),
                ),
              ],
            ),
          ],
          elevation: 4,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // BubbleNormalAudio(
                      //   color: Color(0xFFE8E8EE),
                      //   duration: duration.inSeconds.toDouble(),
                      //   position: position.inSeconds.toDouble(),
                      //   isPlaying: isPlaying,
                      //   isLoading: isLoading,
                      //   isPause: isPause,
                      //   onSeekChanged: _changeSeek,
                      //   onPlayPauseButtonClick: _playAudio,
                      //   sent: true,
                      // ),

                      // DateChip(
                      //   date: new DateTime(2021, 5, 7),
                      //   color: Color(0x558AD3D5),
                      // ),
                      DateChip(
                        date: DateTime.now(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BubbleNormal(
                            text: 'Hello sir, Good Morning',
                            isSender: true,
                            seen: true,
                            bubbleRadius: 12,
                            sent: true,
                            color: Color(0xffE2E4EB),
                            tail: true,
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              '9:32 am',
                              style: TextStyle(
                                color: hintColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: FractionalOffset.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: ClipOval(
                                    child: SizedBox(
                                      height: 20.sp,
                                      width: 20.sp,
                                      child: Image.asset(
                                        'assets/images/12.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                BubbleNormal(
                                  text:
                                      'Oh yes, please send your CV/Resume here',
                                  isSender: false,
                                  // seen: true,
                                  delivered: false,
                                  bubbleRadius: 12,
                                  // sent: true,
                                  color: Color(0xff3AA0FF),
                                  tail: true,
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              '9:30 am',
                              style: TextStyle(
                                color: hintColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.only(right: 5.sp),
                          height: Get.height / 3,
                          width: Get.width / 1.4,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svgs/share.svg'),
                              SizedBox(
                                width: 15.sp,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: Get.height / 3.6,
                                    width: Get.width / 1.8,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/12.png',
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.sp),
                                        topLeft: Radius.circular(10.sp),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: Get.height / 20,
                                    width: Get.width / 1.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.sp),
                                        ),
                                        color: Color(0xffE2E4EB)),
                                    child: Text(
                                      'Hey, Check it out!!',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BubbleNormal(
                            text:
                                'I saw the Api Developer vacancy that you uploaded on linkedin yesterday and I am interested in joining your company.',
                            isSender: true,
                            seen: true,
                            bubbleRadius: 12,
                            sent: true,
                            color: Color(0xffE2E4EB),
                            tail: true,
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              '9:32 am',
                              style: TextStyle(
                                color: hintColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: FractionalOffset.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: ClipOval(
                                    child: SizedBox(
                                      height: 20.sp,
                                      width: 20.sp,
                                      child: Image.asset(
                                        'assets/images/12.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                BubbleNormal(
                                  text:
                                      'I saw the Api Developer vacancy that you uploaded on linkedin yesterday and I am interested in joining your company.',
                                  isSender: false,
                                  // seen: true,
                                  delivered: false,
                                  bubbleRadius: 12,
                                  // sent: true,
                                  color: Color(0xff3AA0FF),
                                  tail: true,
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // DateChip(
                      //   date: new DateTime(2021, 5, 7),
                      //   color: Color(0x558AD3D5),
                      // ),
                      // BubbleNormal(
                      //   text: 'bubble normal with tail',
                      //   isSender: true,
                      //   color: Color(0xFFE8E8EE),
                      //   tail: true,
                      //   sent: true,
                      // ),
                      // DateChip(
                      //   date: new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2),
                      // ),
                      // BubbleNormal(
                      //   text: 'bubble normal without tail',
                      //   isSender: false,
                      //   color: Color(0xFF1B97F3),
                      //   tail: false,
                      //   textStyle: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      // BubbleNormal(
                      //   text: 'bubble normal without tail',
                      //   color: Color(0xFFE8E8EE),
                      //   tail: false,
                      //   sent: true,
                      //   seen: true,
                      //   delivered: true,
                      // ),
                      // BubbleSpecialOne(
                      //   text: 'bubble special one with tail',
                      //   isSender: false,
                      //   color: Color(0xFF1B97F3),
                      //   textStyle: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      // // DateChip(
                      // //   date: new DateTime(now.year, now.month, now.day - 1),
                      // // ),
                      // BubbleSpecialOne(
                      //   text: 'bubble special one with tail',
                      //   color: Color(0xFFE8E8EE),
                      //   seen: true,
                      // ),
                      // BubbleSpecialOne(
                      //   text: 'bubble special one without tail',
                      //   tail: false,
                      //   color: Color(0xFFE8E8EE),
                      //   sent: true,
                      // ),

                      // BubbleSpecialTwo(
                      //   text: 'bubble special tow with tail',
                      //   isSender: true,
                      //   color: Color(0xFFE8E8EE),
                      //   sent: true,
                      // ),
                      // BubbleSpecialTwo(
                      //   text: 'bubble special tow without tail',
                      //   isSender: false,
                      //   tail: false,
                      //   color: Color(0xFF1B97F3),
                      //   textStyle: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      // BubbleSpecialThree(
                      //   text: "bubble special three without tail",
                      //   color: Color(0xFFE8E8EE),
                      //   tail: false,
                      //   isSender: false,
                      // ),
                      // BubbleSpecialThree(
                      //   text: "bubble special three with tail",
                      //   color: Color(0xFFE8E8EE),
                      //   tail: true,
                      //   isSender: false,
                      // ),
                      // SizedBox(
                      //   height: 100,
                      // )
                      SizedBox(
                        height: 5.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(color: Color(0xFFFAFBFF)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffE2E4EB)),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16, color: Color(0xff9C9EB9)),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      // prefixIconConstraints: BoxConstraints(
                      //   maxWidth: 150,
                      //   minWidth: 50
                      // ),
                      prefixIcon: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/svgs/camera.svg',
                            ),
                            VerticalDivider(
                              thickness: 1.sp,
                              indent: 14.sp,
                              endIndent: 14.sp,
                              color: Color(0xffBBBFD0),
                            ),
                            SvgPicture.asset('assets/svgs/imoj.svg'),
                            SizedBox(width: 10.sp,),
                          ],
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svgs/send.svg'),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                      hintText: 'Type Message...',
                      hintStyle: TextStyle(
                        color: Color(0xff8E8E93),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ))
            // MessageBar(
            //   onSend: (_) => print(_),
            //   actions: [
            //     InkWell(
            //       child: Icon(
            //         Icons.add,
            //         color: Colors.black,
            //         size: 24,
            //       ),
            //       onTap: () {},
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(left: 8, right: 8),
            //       child: InkWell(
            //         child: Icon(
            //           Icons.camera_alt,
            //           color: Colors.green,
            //           size: 24,
            //         ),
            //         onTap: () {},
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Center(
        //         child: Text('Today',style: TextStyle(
        //           color: hintColor,
        //           fontWeight: FontWeight.w400,
        //           fontSize: 12.sp,
        //         ),),
        //       ),
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           vertical: 2.h,
        //           horizontal:4.w,
        //         ),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
        //           color: greenColor,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
