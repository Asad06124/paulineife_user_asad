import 'dart:convert';

import 'PostModel.dart';

class RandomPost {
  List<int> ids;
  Map<String, Post> data;

  RandomPost({
    required this.ids,
    required this.data,
  });

  factory RandomPost.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> dataJson = json['data'];
    Map<String, Post> data = {};
    dataJson.forEach((key, value) {
      data[key] = Post.fromJson(value);
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
      Post post = apiResponse.data[id.toString()]!;
      posts.add(post);
    });
    return posts;
  }

  List<Post> get getPost {
    return ids.map((e) => data[e]!).toList();
  }
}
