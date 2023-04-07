import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:rxdart/rxdart.dart';
import 'package:paulineife_user/models/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // getLoginResponse();
    super.onInit();
  }

  var phoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  BehaviorSubject<LoginResponse> loginResponse =
      BehaviorSubject<LoginResponse>();

  Future<void> login() async {
    String phone = phoneController.value.text.toString();
    String password = passwordController.value.text.toString();
    var response = await http.post(Uri.parse('https://rollupp.co/api/login/'),
        body: {'phone': phone, 'password': password});
    if (response.statusCode == 200) {
      var data = LoginResponse.fromJson(jsonDecode(response.body));

      if(data.message == 'Login Success'){
        final prefs = await SharedPreferences.getInstance();
        final key = 'login_response_key';
        final value = jsonEncode(data.toJson());
        prefs.setString(key, value);
      }

    }
  }

  static Future<String?> getLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'login_response_key';
    final value = prefs.getString(key);
    return value;
  }
}
