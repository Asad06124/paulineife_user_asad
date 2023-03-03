import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../views/screens/screen_post_video.dart';

class RegistrationController extends GetxController {
  RxBool isChecked = false.obs;
  File? img;
  List<File> images = [];
  List videos = [];
  File? StoryImg;
  File? vid;
  RxBool liked = true.obs;

  void getFromCameravid() async {
    final pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      Get.to(PostVideoScreen());
      vid = File(pickedFile.path);
    }
  }
}
