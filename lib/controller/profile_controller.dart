import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/models/api/ProfileResponse.dart';

import '../models/Login.dart';
import 'login_controller.dart';

class ProfileController extends GetxController {
  String username;

  @override
  void onInit() {
    fetchUserProfile(username);
    super.onInit();
  }

  RxBool followed = false.obs;
  var ids = RxList<int>([]);
  var profile = Rx<Profile?>(null);
  var posts = RxList<PostOrThread>([]);
  var profileResponse = Rx<ProfileResponse?>(null);

  void fetchUserProfile(String username) async {
    var loginResponse = await LoginController.getLoginResponse();
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));

    final response = await http.get(
      Uri.parse("https://rollupp.co/api/profile/$username"),
      headers: {
        "Authorization": "Bearer ${data.token?.accessToken}",
      },
    );
    log(response.body);
    profileResponse.value = ProfileResponse.fromJson(jsonDecode(response.body));
    followed.value = profileResponse.value!.followed;
    posts.value = profileResponse.value!.getPostOrThreadList();
    ids.value = profileResponse.value!.ids;
    profile.value = profileResponse.value!.profile;
    posts.value = profileResponse.value!.getPostOrThreadList();
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
        "Authorization": "Bearer ${data.token?.accessToken}",
      },
    );
    print(response.body);
    var result = jsonDecode(response.body) as Map<String, dynamic>;
    followed.value = result['follow'] ?? false;
  }
}
