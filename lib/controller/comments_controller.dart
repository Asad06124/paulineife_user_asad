import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paulineife_user/controller/login_controller.dart';
import 'package:paulineife_user/models/Login.dart';

import '../models/api/CommentResponse.dart';

class CommentsController extends GetxController {
  String postId;
  RxList<Comment> comments = RxList<Comment>([]);
  var loading = false.obs;

  CommentsController({
    required this.postId,
  });

  @override
  void onInit() {
    fetchComments();
    super.onInit();
  }

  void fetchComments() async {
    loading.value = true;

    var loginResponse = await LoginController.getLoginResponse();
    print("loginResponse: $loginResponse");
    var data = LoginResponse.fromJson(jsonDecode(loginResponse ?? "{}"));

    final response = await http.get(
      Uri.parse("https://rollupp.co/post/get-comments/$postId"),
      headers: {"Authorization": "Bearer ${data.accessToken}"},
    );

    var commentsResponse = CommentResponse.fromJson(jsonDecode(response.body));
    comments.value = commentsResponse.getComments().values.toList();
    loading.value = false;
  }
}
