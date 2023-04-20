import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/constant/constant.dart';
import 'package:paulineife_user/helpers/helpers.dart';
import 'package:paulineife_user/models/api/ProfileResponse.dart';

import '../models/Login.dart';
import '../models/api/PostModel.dart';
import 'login_controller.dart';

class ProfileController extends GetxController {
  String username;
  String _loggedInUsername = "";
  RxBool isLoggedInUser = false.obs;

  @override
  void onInit() {
    fetchUserProfile(username);
    super.onInit();
  }

  RxBool followed = false.obs;
  var ids = RxList<int>([]);
  var profile = Rx<Profile?>(null);
  var posts = RxList<Post>([]);
  var profileResponse = Rx<ProfileResponse?>(null);
  var imageUrl = "$userPlaceholder".obs;

  void fetchUserProfile(String username) async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));
    isLoggedInUser.value = data.username == username;

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/profile/$username"),
      headers: {
        "Authorization": "Bearer ${data.accessToken}",
      },
    );
    log(response.body);
    Clipboard.setData(ClipboardData(text: response.body));
    profileResponse.value = ProfileResponse.fromJson(jsonDecode(response.body));
    followed.value = profileResponse.value!.followed;
    posts.value = profileResponse.value!.posts;
    ids.value = profileResponse.value!.ids;
    profile.value = profileResponse.value!.profile;

    imageUrl.value = domainUrlWithProtocol + profile.value!.image;
    imageUrl.value = !imageUrl.value.endsWith('null') ? imageUrl.value : userPlaceholder;

    print(profile.toJson());
    // print(posts[2].image);
  }

  void fetchUserProfile2(String username) async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));
    isLoggedInUser.value = data.username == username;

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/profile/$username"),
      headers: {
        "Authorization": "Bearer ${data.accessToken}",
      },
    );
    log(response.body);
    Clipboard.setData(ClipboardData(text: response.body));

    // print(posts[2].image);
  }

  ProfileController({
    required this.username,
  });

  void followOrUnfollowUser() async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/follow/$username"),
      headers: {
        "Authorization": "Bearer ${data.accessToken}",
      },
    );
    print(response.body);
    var result = jsonDecode(response.body) as Map<String, dynamic>;
    if (result['follow'] == null) {
      showMessageSheet("Warning", "You cannot follow yourself", sheetType: BottomSheetType.warning);
    }
    followed.value = result['follow'] ?? false;
  }

// bool get isLoggedInUser => _loggedInUsername == username;
}
