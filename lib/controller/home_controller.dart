import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/controller/login_controller.dart';
import 'package:paulineife_user/models/api/HomeResponse.dart';
import 'package:paulineife_user/models/api/random_post.dart';

import '../models/Login.dart';
import '../models/api/PostModel.dart';
import '../models/api/refresh_post.dart';
import '../models/post.dart';

class HomeController extends GetxController {
  RxBool isChecked = false.obs;
  File? img;
  List<File> images = [];
  File? StoryImg;
  File? vid;

  RxBool liked = true.obs;
  var posts = Rx<List<Post>>([]);
  var stories = Rx<List<Story>>([]);
  var uploadPostsLoading = false.obs;


  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {

    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    var data = LoginResponse.fromJson(jsonDecode(loginResponse??""));

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/home/?page=1"),
      headers: {
        "Authorization":
            "Bearer ${data.token?.accessToken}"
      },
    );
    print("fetchHomeData: ${response.body}");
    var obj = HomeResponse.fromJson(jsonDecode(response.body));
    posts.value = obj.getPostList;
    stories.value = obj.getStoryList;
  }

  void fetchRefreshPost() async {


    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse??""));

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/refereshpost/"),
      headers: {
        "Authorization":
            "Bearer ${data.token?.accessToken}"
      },
    );
    var obj = RefreshPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
  }

  void fetchRandomPost() async {


    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse??""));

    final response = await http.get(
      Uri.parse('https://rollupp.co/api/randompost/?page=1'),
      headers: {
        "Authorization":
            "Bearer ${data.token?.accessToken}"
      },
    );
    print("fetchRandomPost: ${response.body}");

    var obj = RandomPost.fromJson(jsonDecode(response.body));
    posts.value = obj.getPost;
  }



  Future<void> uploadPosts(List<ThreadPost> posts) async {
    uploadPostsLoading.value = true;

    var request = http.MultipartRequest('POST', Uri.parse("http://rollupp.co/post/uploadthread"));

    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse??""));

    for (var post in posts) {
      request.fields['post[${posts.indexOf(post)}][caption]'] = post.caption;

      var imageFile = await post.getImageFile();
      if (imageFile != null) {
        request.files.add(imageFile);
      }

      var videoFile = await post.getVideoFile();
      if (videoFile != null) {
        request.files.add(videoFile);
      }
    }

    request.headers.addAll({
      "Authorization": "Bearer ${data.token?.accessToken}"
    });

    var response = await request.send().catchError((_){
      uploadPostsLoading.value = false;
    });
    uploadPostsLoading.value = false;

    print(response);

    if (response.statusCode == 200) {
      print('Posts uploaded successfully.');
    } else {
      print('Failed to upload posts.');
    }
  }
}
