class UploadPost {
  List<Post>? post;

  UploadPost({this.post});

  UploadPost.fromJson(Map<String, dynamic> json) {
    if (json['post'] != null) {
      post = <Post>[];
      json['post'].forEach((v) {
        post!.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String? caption;
  int? isThread;
  int? user;

  Post({this.caption, this.isThread, this.user});

  Post.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    isThread = json['is_thread'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['is_thread'] = this.isThread;
    data['user'] = this.user;
    return data;
  }
}
