import 'package:custom_utils/custom_utils.dart';

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat_list.dart';

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
          leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.black, onPressed: () { Get.off(ChatListScreen()); },),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(8.h),
            child: Container(
              height: 10.h,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: ClipOval(
                            child: SizedBox(
                                height: 50.sp,
                                width: 50.sp,
                                child: Image.asset(
                                  'assets/images/12.png',
                                  fit: BoxFit.fill,
                                ),),),
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6.sp,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 2.w,
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
                          ),
                        ],
                      )
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 4.w),
                  //   child: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.search,
                  //         color: greenC,
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ],
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
                            color: Colors.green,
                            tail: true,
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
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
                                  ),),
                                  ),
                                ),
                                BubbleNormal(
                                  text: 'Oh yes, please send your CV/Resume here',
                                  isSender: false,
                                  // seen: true,
                                  delivered: false,
                                  bubbleRadius: 12,
                                  // sent: true,
                                  color: Colors.greenAccent,
                                  tail: true,
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
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
                      BubbleNormalImage(
                        id: 'id001',
                        // image: _image(),
                        color: Colors.blue.withOpacity(.8),
                        // tail: true,
                        // delivered: true,
                        image: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/12.png',
                            fit: BoxFit.fill,
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
                            text:'I saw the Api Developer vacancy that you uploaded on linkedin yesterday and I am interested in joining your company.',
                            isSender: true,
                            seen: true,
                            bubbleRadius: 12,
                            sent: true,
                            color: Colors.green,
                            tail: true,
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.greenAccent,
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
                                        ),),
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
                                  color: Colors.greenAccent,
                                  tail: true,
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                            color: Colors.green,
                            tail: true,
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
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
                                        ),),
                                  ),
                                ),
                                BubbleNormal(
                                  text: 'Oh yes, please send your CV/Resume here',
                                  isSender: false,
                                  // seen: true,
                                  delivered: false,
                                  bubbleRadius: 12,
                                  // sent: true,
                                  color: Colors.greenAccent,
                                  tail: true,
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BubbleNormal(
                            text:'I saw the Api Developer vacancy that you uploaded on linkedin yesterday and I am interested in joining your company.',
                            isSender: true,
                            seen: true,
                            bubbleRadius: 12,
                            sent: true,
                            color: Colors.greenAccent,
                            tail: true,
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
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
                                  ),),
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
                                  color: Colors.greenAccent,
                                  tail: true,
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
              decoration: BoxDecoration(
                  color:Color(0xFFFAFBFF)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomInputField1(
                      hint: 'Write your massage',
                      prefix:IconButton(onPressed: () {  }, icon:  Icon(Icons.attach_file_outlined),

                      ),
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.send_outlined,color: Colors.white,),
                  ),
                ],),
            )
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