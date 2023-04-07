import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ThreadPost {
  final String caption;
  final File? image;
  final File? video;

  ThreadPost({required this.caption, this.image, this.video});

  Map<String, String> toJson() {
    return {
      'caption': caption,
    };
  }

  Future<http.MultipartFile?> getImageFile() async {
    if (image != null) {
      return await http.MultipartFile.fromPath('image', image!.path);
    } else {
      return null;
    }
  }

  Future<http.MultipartFile?> getVideoFile() async {
    if (video != null) {
      return await http.MultipartFile.fromPath('video', video!.path);
    } else {
      return null;
    }
  }
}