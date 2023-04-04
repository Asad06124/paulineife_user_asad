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
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      caption: json['caption'],
      image: json['image'],
      video: json['video'],
      timestamp: DateTime.parse(json['timestamp']),
      isThread: json['is_thread'],
      views: json['views'],
      user: json['user'],
      likes: json['likes'] != null
          ? List<int>.from(json['likes'].map((x) => x))
          : null,
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
