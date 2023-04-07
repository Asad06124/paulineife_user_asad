import 'package:paulineife_user/constant/constant.dart';

class Post {
  final int id;
  final String caption;
  final String? image;
  final String? video;
  final DateTime timestamp;
  final bool isThread;
  final int views;
  final int user;
  final List<int>? likes;
  final String username;
  final String userImage;

  Post({
    required this.id,
    required this.caption,
    this.image,
    this.video,
    required this.timestamp,
    required this.isThread,
    required this.views,
    required this.user,
    this.likes,
    required this.username,
    required this.userImage,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      caption: json['caption'],
      image: json['image'],
      video: json['video'],
      timestamp: DateTime.tryParse(json['timestamp'].toString()) ?? DateTime.now(),
      isThread: json['is_thread'],
      views: json['views'],
      user: json['user'],
      likes: json['likes'] != null
          ? List<int>.from(json['likes'].map((x) => x))
          : null,
      username: json['username'],
      userImage: "$domainProtocol$domainUrl" + json['userimage'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'caption': caption,
      'timestamp': timestamp.toIso8601String(),
      'is_thread': isThread,
      'views': views,
      'user': user,
      'username': username,
      'userimage': userImage,
    };
    if (image != null) {
      data['image'] = image;
    }
    if (video != null) {
      data['video'] = video;
    }
    if (likes != null) {
      data['likes'] = likes;
    }
    return data;
  }
}
