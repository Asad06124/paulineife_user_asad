import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/models/api/HomeResponse.dart';
import 'package:paulineife_user/models/api/ProfileResponse.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    startTestApi();

    super.onInit();
  }

  void startTestApi() async {
    var response = await http.get(
      Uri.parse("https://rollupp.co/api/profile/testing"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMyNzYxNTk5LCJpYXQiOjE2NzI3NjE1OTksImp0aSI6ImRkMmJkNWJiMmRlMzRjZjdhYjRlZGQ1YmQxZmVkMmRmIiwidXNlcl9pZCI6MTJ9.dKB5IwpXWOQpRe0WTZPZ_jAI241KbELuj50epbv0PSU"
      },
    );

    print(response.body);
    var obj = ProfileResponse.fromJson(jsonDecode(response.body));
    print(obj.ids);
    print(obj.posts);
  }
}
