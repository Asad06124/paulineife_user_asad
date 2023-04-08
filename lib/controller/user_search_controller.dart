import 'dart:convert';

import 'package:get/get.dart';
import 'package:paulineife_user/models/api/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserSearchController extends GetxController {
  RxList<User> users = RxList<User>([]);
  RxList<User> filteredUsers = RxList<User>([]);

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    var response = await http.get(
        Uri.parse(
          "https://rollupp.co/api/search/test",
        ),
        headers: {
          "Authorization": "Bearer ",
        });
    var data = jsonDecode(response.body);
    List<User> userList = List<User>.from(data.map((x) => User.fromMap(x)));
    users.value = userList;
    filteredUsers.value = userList;
  }

  static Future<String?> getLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'login_response_key';
    final value = prefs.getString(key);
    return value;
  }
}
