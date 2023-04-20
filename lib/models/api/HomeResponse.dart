import 'package:flutter/material.dart';

import 'PostModel.dart';
import 'StoryModel.dart';
import 'ThreadModel.dart';

class HomeResponse {
  final List<Post> posts;
  final List<Story> stories;

  HomeResponse({required this.posts, required this.stories});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    final postIds = (json['post_id'] as List<dynamic>).cast<int>();
    final storyIds = (json['story_id'] as List<dynamic>).cast<int>();
    final postData = Map<String, dynamic>.from(json['post']);
    final storyData = Map<String, dynamic>.from(json['stories']);

    final posts = <Post>[];
    final stories = <Story>[];

    for (final id in postIds) {
      final postJson = postData[id.toString()];

      if (postJson is List<dynamic>) {
        final threadPost = ThreadPost.fromJson(postJson.first as Map<String, dynamic>);
        final childPosts = postJson.skip(1).map((post) => Post.fromJson(post as Map<String, dynamic>)).toList();
        threadPost.childPosts = childPosts;

        posts.add(threadPost);
      } else {
        final post = Post.fromJson(postJson as Map<String, dynamic>);
        posts.add(post);
      }
    }

    for (final id in storyIds) {
      final storyJson = storyData[id.toString()];
      final story = Story.fromJson(storyJson as Map<String, dynamic>);
      stories.add(story);
    }

    return HomeResponse(posts: posts, stories: stories);
  }
}
