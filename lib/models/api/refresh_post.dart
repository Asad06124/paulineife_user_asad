import 'dart:convert';

import 'PostModel.dart';

class RefreshPost {
  List<int> ids;
  Map<String, Post> data;

  RefreshPost({
    required this.ids,
    required this.data,
  });

  factory RefreshPost.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> dataJson = json['data'];
    Map<String, Post> data = {};
    dataJson.forEach((key, value) {
      data[key] = Post.fromJson(value);
    });
    return RefreshPost(
      ids: List<int>.from(json['ids']),
      data: data,
    );
  }

  static List<Post> parsePostsFromJson(String jsonString) {
    RefreshPost apiResponse = RefreshPost.fromJson(jsonDecode(jsonString));
    List<Post> posts = [];
    apiResponse.ids.forEach((id) {
      Post post = apiResponse.data[id.toString()]!;
      posts.add(post);
    });
    return posts;
  }

  List<Post> get getPost {
    List<Post> posts = [];
    ids.forEach((id) {
      Post? post = data[id.toString()];
      if (post != null) {
        posts.add(post);
      }
    });
    print(posts);
    return posts;
  }

}
