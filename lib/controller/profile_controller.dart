import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/models/api/ProfileResponse.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  RxBool followed = false.obs;
  var ids = RxList<int>([]);
  Profile? profile;
  var posts = RxList<PostOrThread>([]);

  void fetchUserProfile() async {
    final response = await http.get(
      Uri.parse("https://rollupp.co/api/profile/testing"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMyNzU5NDE5LCJpYXQiOjE2NzI3NTk0MTksImp0aSI6Ijc0YzAzZDA3ZGViYTQ3NWY4ZjZiYzc4ODQwNWQ2NmYzIiwidXNlcl9pZCI6MTN9.EtcCwAbRExo3vTK12UxUdllb3Vehx6I6OxIncfglkPE",
      },
    );
    // print(response.body);
    var obj = ProfileResponse.fromJson(jsonDecode(response.body));

    posts.value = obj.getPostOrThreadList();
    ids.value = obj.ids;
    profile = obj.profile;
    print(posts[2].image);
  }
}
