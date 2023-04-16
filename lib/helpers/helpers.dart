// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart' as auth;
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/platform/platform.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// var dbInstance = FirebaseFirestore.instance;
// // var uid = FirebaseAuth.instance.currentUser!.uid;
//
// CollectionReference userRef = dbInstance.collection("users");
// CollectionReference postRef = dbInstance.collection("posts");
// String placeholder_url = "https://phito.be/wp-content/uploads/2020/01/placeholder.png";
// String userPlaceHolder = "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png";
// String appName = "Paulineife";
//
// double roundDouble(double value, int places) {
//   num mod = pow(10.0, places);
//   return ((value * mod).round().toDouble() / mod);
// }
//
//
// Future<void> launchUrl(String url) async {
//   url = !url.startsWith("http") ? ("http://" + url) : url;
//   if (await canLaunch(url)) {
//     launch(
//       url,
//       forceSafariVC: true,
//       enableJavaScript: true,
//       forceWebView: GetPlatform.isAndroid,
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }


import 'package:device_info/device_info.dart';
import 'package:extended_image/extended_image.dart';
import 'package:permission_handler/permission_handler.dart';


const userPlaceholder = "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png";
const placeholderUrl = "https://talentclick.com/wp-content/uploads/2021/08/placeholder-image.png";

Future<bool> getStoragePermission() async {
  var status = await Permission.manageExternalStorage.request();
  if (status == PermissionStatus.permanentlyDenied){
    openAppSettings();
  }
  return status.isGranted;
}

Future<int> get getAndroidVersion async {

  var androidInfo = await DeviceInfoPlugin().androidInfo;
  var release = androidInfo.version.release;
  return (int.tryParse(release) ?? 0);
}

GestureConfig getImageZoomScale() {
  return GestureConfig(
    minScale: 0.9,
    animationMinScale: 0.7,
    maxScale: 3.0,
    animationMaxScale: 3.5,
    speed: 1.0,
    inertialSpeed: 100.0,
    initialScale: 1.0,
    inPageView: false,
    initialAlignment: InitialAlignment.center,
  );
}
