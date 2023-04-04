import 'package:paulineife_user/models/api/PostModel.dart';

class HomeResponse {
  List<int> postIds;
  Map<int, Story> stories;
  Map<int, Post> post;

  HomeResponse({
    required this.postIds,
    required this.stories,
    required this.post,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    final postIds =
        json['post_id'] != null ? List<int>.from(json['post_id']) : <int>[];

    final storiesJson = json['stories'] ?? {};
    final stories = Map<int, Story>.from(
      storiesJson
          .map((key, value) => MapEntry(int.parse(key), Story.fromJson(value))),
    );

    final postJson = json['post'] ?? {};
    final post = Map<int, Post>.from(
      postJson
          .map((key, value) => MapEntry(int.parse(key), Post.fromJson(value))),
    );

    return HomeResponse(
      postIds: postIds,
      stories: stories,
      post: post,
    );
  }

  List<Post> get getPostList {
    return postIds.map((id) => post[id]!).toList();
  }

  List<Story> get getStoryList {
    return stories.values.toList();
  }
}

class Story {
  int id;
  String caption;
  String? image;
  String? video;
  DateTime timestamp;
  bool isThread;
  int views;
  int user;

  Story({
    required this.id,
    required this.caption,
    this.image,
    this.video,
    required this.timestamp,
    required this.isThread,
    required this.views,
    required this.user,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      caption: json['caption'],
      image: json['image'],
      video: json['video'],
      timestamp: DateTime.parse(json['timestamp']),
      isThread: json['is_thread'],
      views: json['views'],
      user: json['user'],
    );
  }
}

