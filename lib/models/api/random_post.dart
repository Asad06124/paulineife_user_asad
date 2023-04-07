import 'dart:convert';

import 'PostModel.dart';

class RandomPost {
  List<int> ids;
  Map<String, dynamic> data;

  RandomPost({
    required this.ids,
    required this.data,
  });

  factory RandomPost.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> dataJson = json['data'];
    Map<String, dynamic> data = {};
    dataJson.forEach((key, value) {
      if (value is List<dynamic>) {
        List<Post> posts = [];
        value.forEach((element) {
          posts.add(Post.fromJson(element));
        });
        data[key] = posts;
      } else {
        data[key] = Post.fromJson(value);
      }
    });
    return RandomPost(
      ids: List<int>.from(json['ids']),
      data: data,
    );
  }

  static List<Post> parsePostsFromJson(String jsonString) {
    RandomPost apiResponse = RandomPost.fromJson(jsonDecode(jsonString));
    List<Post> posts = [];
    apiResponse.ids.forEach((id) {
      var data = apiResponse.data[id.toString()];
      if (data is Post) {
        posts.add(data);
      } else if (data is List<Post>) {
        posts.addAll(data);
      }
    });
    return posts;
  }

  List<Post> get getPost {
    List<Post> posts = [];
    ids.forEach((id) {
      var data = this.data[id.toString()];
      if (data is Post) {
        posts.add(data);
      } else if (data is List<Post>) {
        posts.addAll(data);
      }
    });
    return posts;
  }
}
