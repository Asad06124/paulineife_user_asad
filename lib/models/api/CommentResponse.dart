import 'package:paulineife_user/constant/constant.dart';

class CommentResponse {
  Map<String, dynamic> comment;

  CommentResponse({required this.comment});

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    return CommentResponse(
      comment: json['comment'],
    );
  }

  Map<String, Comment> getComments() {
    Map<String, Comment> parentComments = {};

    comment.forEach((key, value) {
      if (value is List) {
        // Pick the first object as parent comment
        Comment parentComment = Comment.fromJson(value[0]);
        parentComment.replies = [];

        // Populate the replies list
        for (int i = 1; i < value.length; i++) {
          Comment reply = Comment.fromJson(value[i]);
          parentComment.replies.add(reply);
        }

        parentComments[key] = parentComment;
      } else if (value is Map<String, dynamic>) {
        // Single object as a comment without replies
        Comment singleComment = Comment.fromJson(value);
        singleComment.replies = [];

        parentComments[key] = singleComment;
      }
    });

    return parentComments;
  }
}

class Comment {
  int id;
  String comment;
  String? voice;
  bool? isReply;
  String timestamp;
  int? posts;
  int user;
  int? parent;
  List<Comment> replies;

  Comment({
    required this.id,
    required this.comment,
    this.voice,
    this.isReply,
    required this.timestamp,
    this.posts,
    required this.user,
    this.parent,
    this.replies = const [],
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      voice: json['voice'],
      isReply: json['is_reply'],
      timestamp: json['timestump'],
      posts: json['posts'],
      user: json['user'],
      parent: json['parent'],
    );
  }


  String get getVoice {
    return "$domainUrlWithProtocol$voice";
  }
}
