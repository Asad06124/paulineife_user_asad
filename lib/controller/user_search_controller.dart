import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/models/api/user_search_model.dart';

import '../helpers/search_helper_sharedprefs.dart';
import '../models/Login.dart';
import 'login_controller.dart';

class UserSearchController extends GetxController {
  RxList<SearchUser> users = RxList<SearchUser>([]);
  RxList<SearchUser> filteredUsers = RxList<SearchUser>([]);
  var textController = TextEditingController().obs;
  var searchLoading = false.obs;
  LoginResponse? loginData;
  var recentSearches = Rx<List<SearchUser>>([]);

  @override
  void onInit() {
    refreshRecentSearches();
    super.onInit();
  }

  void fetchUsers(String query) async {
    if (query.isEmpty) {
      filteredUsers.clear();
      return;
    }
    searchLoading.value = true;
    if (loginData == null) {
      await getloginResponse();
    }
    var response = await http.get(
        Uri.parse(
          "https://rollupp.co/api/search/$query",
        ),
        headers: {
          "Authorization": "Bearer ${loginData?.token?.accessToken}",
        });
    var data = jsonDecode(response.body);
    List<SearchUser> userList = List<SearchUser>.from(data.map((x) => SearchUser.fromMap(x)));
    users.value = userList;
    filteredUsers.value = userList;
    searchLoading.value = false;
  }

  Future<void> getloginResponse() async {
    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    loginData = LoginResponse.fromJson(jsonDecode(loginResponse ?? ""));
  }

  void refreshRecentSearches() async {
    recentSearches.value = (await fetchSearchUserListFromSharedPreferences()).reversed.toList();
  }
}
