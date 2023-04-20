import 'PostModel.dart';
import 'ThreadModel.dart';

class RefreshPost {
  final List<Post> posts;

  RefreshPost({required this.posts});

  factory RefreshPost.fromJson(Map<String, dynamic> json) {
    final ids = (json['ids'] as List<dynamic>).cast<int>();
    final data = Map<String, dynamic>.from(json['data']);

    final posts = <Post>[];

    for (final id in ids) {
      final postData = data[id.toString()];

      if (postData is List<dynamic>) {
        final threadPost = ThreadPost.fromJson(postData.first as Map<String, dynamic>);
        final childPosts = postData.skip(1).map((post) => Post.fromJson(post as Map<String, dynamic>)).toList();

        threadPost.childPosts = childPosts;

        posts.add(threadPost);
        // posts.addAll(childPosts);
      } else {
        final post = Post.fromJson(postData as Map<String, dynamic>);
        posts.add(post);
      }
    }

    return RefreshPost(posts: posts);
  }
}

