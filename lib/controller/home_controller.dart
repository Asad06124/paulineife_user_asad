import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/models/api/HomeResponse.dart';
import 'package:paulineife_user/models/api/random_post.dart';

import '../models/api/PostModel.dart';
import '../models/api/refresh_post.dart';

class HomeController extends GetxController {
  RxBool isChecked = false.obs;
  File? img;
  List<File> images = [];
  File? StoryImg;
  File? vid;

  RxBool liked = true.obs;
  var posts = Rx<List<Post>>([]);
  var stories = Rx<List<Story>>([]);

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    final response = await http.get(
      Uri.parse("https://rollupp.co/api/home/?page=1"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMyNzYxNTk5LCJpYXQiOjE2NzI3NjE1OTksImp0aSI6ImRkMmJkNWJiMmRlMzRjZjdhYjRlZGQ1YmQxZmVkMmRmIiwidXNlcl9pZCI6MTJ9.dKB5IwpXWOQpRe0WTZPZ_jAI241KbELuj50epbv0PSU"
      },
    );
    var obj = HomeResponse.fromJson(jsonDecode(response.body));
    posts.value = obj.getPostList;
    stories.value = obj.getStoryList;
  }

  void fetchRefreshPost() async {
    final response = await http.get(
      Uri.parse("https://rollupp.co/api/refereshpost/"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMyNzYxNTk5LCJpYXQiOjE2NzI3NjE1OTksImp0aSI6ImRkMmJkNWJiMmRlMzRjZjdhYjRlZGQ1YmQxZmVkMmRmIiwidXNlcl9pZCI6MTJ9.dKB5IwpXWOQpRe0WTZPZ_jAI241KbELuj50epbv0PSU"
      },
    );
    var obj = RefreshPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
  }

  void fetchRandomPost() async {
    final response = await http.get(
      Uri.parse('https://rollupp.co/api/randompost/?page=2'),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMyNzYxNTk5LCJpYXQiOjE2NzI3NjE1OTksImp0aSI6ImRkMmJkNWJiMmRlMzRjZjdhYjRlZGQ1YmQxZmVkMmRmIiwidXNlcl9pZCI6MTJ9.dKB5IwpXWOQpRe0WTZPZ_jAI241KbELuj50epbv0PSU"
      },
    );
    var obj = RandomPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
    print(posts.value.first.image);
  }
}
