import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/models/Login.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // getLoginResponse();
    super.onInit();
  }

  var phoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  BehaviorSubject<LoginResponse> loginResponse = BehaviorSubject<LoginResponse>();
  static var loginLoading = false.obs;

  static Future<void> login(String emailOrPhone, String password) async {
    loginLoading.value = true;
    var response = await http.post(Uri.parse('https://rollupp.co/api/login/'), body: {'phone': emailOrPhone, 'password': password});
    log("Login response: ${response.body}");
    if (response.statusCode == 200) {
      var data = LoginResponse.fromJson(jsonDecode(response.body));
      if (data.message == 'Login Success') {
        final prefs = await SharedPreferences.getInstance();
        final key = 'login_response_key';
        final value = jsonEncode(data.toJson());
        prefs.setString(key, value);
      }
      Get.offAll(HomeScreen());
    } else {
      Get.snackbar(
        "Error",
        jsonDecode(response.body)['errors'].toString(),
        backgroundColor: CupertinoColors.black,
        colorText: CupertinoColors.white,
        snackPosition: SnackPosition.BOTTOM
      );
    }
    loginLoading.value = false;
  }

  static Future<String?> getLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'login_response_key';
    final value = prefs.getString(key);
    return value;
  }
}
