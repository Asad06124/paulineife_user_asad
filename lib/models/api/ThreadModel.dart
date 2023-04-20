import 'PostModel.dart';

class ThreadPost extends Post {
  List<Post> childPosts;

  ThreadPost({
    required int id,
    required String caption,
    String? image,
    required DateTime timestamp,
    required bool isThread,
    int views = 0,
    required int user,
    required List<int> likes,
    required String username,
    required String userImage,
    required this.childPosts,
  }) : super(
    id: id,
    caption: caption,
    image: image,
    timestamp: timestamp,
    isThread: isThread,
    views: views,
    user: user,
    likes: likes,
    username: username,
    userImage: userImage,
  );

  factory ThreadPost.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final caption = json['caption'] as String;
    final image = json['image'] as String?;
    final timestamp = DateTime.parse(json['timestamp'] as String);
    final isThread = json['is_thread'] as bool;
    final views = json['views'] as int? ?? 0;
    final user = json['user'] as int;
    final likes = (json['likes'] as List<dynamic>).cast<int>();
    final username = json['username'] as String;
    final userimage = json['userimage'] as String;
    final childPosts = (json['posts'] as List<dynamic>? ?? []).map((post) => Post.fromJson(post as Map<String, dynamic>)).toList();

    return ThreadPost(
      id: id,
      caption: caption,
      image: image,
      timestamp: timestamp,
      isThread: isThread,
      views: views,
      user: user,
      likes: likes,
      username: username,
      userImage: userimage,
      childPosts: childPosts,
    );
  }
}
