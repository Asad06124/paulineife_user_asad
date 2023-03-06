// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:paulineife_user/views/screens/screen_post_video.dart';
// import 'package:sizer/sizer.dart';
// // import 'package:video_trimmer/video_trimmer.dart';
//
// import '../../controller/registration_controller.dart';
// import '../../helpers/theme_service.dart';
// import '../../widgets/custom_buttom.dart';
//
// class VideoGalleryScreen extends StatelessWidget {
//   VideoGalleryScreen({Key? key, required this.videosList}) : super(key: key);
//   List videosList;
//   var controller = Get.put(RegistrationController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: 5.sp,
//                 ),
//                 Text(
//                   'Gallery',
//                   style: TextStyle(
//                     color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 100.sp,
//                 ),
//                 CustomButton1(
//                   text: 'Select',
//                   elevation: 0,
//                   textStyle: TextStyle(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
//                   ),
//                   onPressed: () {},
//                   color: Color(0xffE2E4EB),
//                   height: 35.sp,
//                   width: 75.sp,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                 ),
//                 SizedBox(
//                   width: 5.sp,
//                 ),
//               ],
//             ),
//             Expanded(
//                 child: GridView.builder(
//               itemCount: videosList.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1.sp, mainAxisSpacing: 1.sp),
//               itemBuilder: (BuildContext context, int index) {
//                 return index == 0
//                     ? GestureDetector(
//                         onTap: () {
//                           controller.getFromCameravid();
//                         },
//                         child: Container(
//                           color: Color(0xffE2E4EB),
//                           padding: EdgeInsets.all(30.sp),
//                           child: SvgPicture.asset('assets/svgs/camera3.svg'),
//                         ),
//                       )
//                     : Stack(children: [
//                         Container(
//                           height: Get.height,
//                           width: Get.width,
//                           color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
//                           child: VideoViewer(
//                             trimmer: Trimmer()..loadVideo(videoFile: File(videosList[index])),
//                           ),
//                         ),
//                         Positioned(
//                           top: 0,
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: TextButton(
//                             child: Icon(
//                               Icons.play_arrow_outlined,
//                               size: 35.sp,
//                               color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
//                             ),
//                             onPressed: () {
//                               controller.vid = File(videosList[index]);
//                               controller.update();
//                               Get.to(PostVideoScreen());
//                             },
//                           ),
//                         ),
//                       ]);
//               },
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
