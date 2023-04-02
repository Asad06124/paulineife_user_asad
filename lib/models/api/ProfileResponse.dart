import 'dart:convert';

class ProfileResponse {
  final Profile profile;
  final bool followed;
  final List<int> ids;
  final Map<int, List<PostOrThread>> posts;

  ProfileResponse({
    required this.profile,
    required this.followed,
    required this.ids,
    required this.posts,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    final profileJson = json['profile'] as Map<String, dynamic>;
    final postJson = json['post'] as Map<String, dynamic>;

    final profile = Profile(
      id: profileJson['id'],
      email: profileJson['email'],
      username: profileJson['username'],
      firstname: profileJson['firstname'],
      lastname: profileJson['lastname'],
      image: profileJson['image'],
      numberOfFollowers: profileJson['number_of_followers'],
      numberOfFollowing: profileJson['number_of_following'],
      phone: profileJson['phone'],
      dob: profileJson['dob'],
      website: profileJson['website'],
      bio: profileJson['bio'],
    );

    final ids = List<int>.from(json['ids'].map((id) => id));

    final posts = <int, List<PostOrThread>>{};
    postJson.forEach((key, value) {
      if (value is List) {
        final threadList = <PostOrThread>[]; // change Thread to PostOrThread
        for (final threadJson in value) {
          final thread = PostOrThread(
            id: threadJson['id'],
            caption: threadJson['caption'],
            image: threadJson['image'],
            video: threadJson['video'],
            timestamp: threadJson['timestamp'],
            isThread: true,
            views: threadJson['views'],
            user: threadJson['user'],
            likes: threadJson['likes'] != null
                ? List<int>.from(threadJson['likes'].map((x) => x))
                : null,
            postId: threadJson['post_id'],
          );
          threadList.add(thread);
        }
        posts[int.parse(key)] = threadList;
      } else {
        final postOrThread = PostOrThread.fromJson(value);
        posts[int.parse(key)] = [postOrThread];
      }
    });


    return ProfileResponse(
      profile: profile,
      followed: json['followed'],
      ids: ids,
      posts: posts,
    );
  }

  List<PostOrThread> getPostOrThreadList() {
    final postOrThreadList = <PostOrThread>[];
    for (final postOrThreadList in posts.values) {
      postOrThreadList.forEach((postOrThread) {
        postOrThreadList.add(postOrThread);
      });
    }
    return postOrThreadList;
  }
}




class Profile {
  final int id;
  final String email;
  final String username;
  final String firstname;
  final String lastname;
  final String image;
  final int numberOfFollowers;
  final int numberOfFollowing;
  final String phone;
  final String dob;
  final String website;
  final String bio;

  Profile({
    required this.id,
    required this.email,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.image,
    required this.numberOfFollowers,
    required this.numberOfFollowing,
    required this.phone,
    required this.dob,
    required this.website,
    required this.bio,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      image: json['image'],
      numberOfFollowers: json['number_of_followers'],
      numberOfFollowing: json['number_of_following'],
      phone: json['phone'],
      dob: json['dob'],
      website: json['website'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'image': image,
      'number_of_followers': numberOfFollowers,
      'number_of_following': numberOfFollowing,
      'phone': phone,
      'dob': dob,
      'website': website,
      'bio': bio,
    };
    return data;
  }
}


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


class Thread {
  final int id;
  final String caption;
  final String? image;
  final int? postId;

  Thread({
    required this.id,
    required this.caption,
    this.image,
    this.postId,
  });
}



class PostOrThread {
  final int id;
  final String caption;
  final String? image;
  final String? video;
  final String timestamp;
  final bool isThread;
  final int views;
  final int user;
  final List<int>? likes;
  final int? postId;

  PostOrThread({
    required this.id,
    required this.caption,
    this.image,
    this.video,
    required this.timestamp,
    required this.isThread,
    required this.views,
    required this.user,
    this.likes,
    this.postId,
  });

  factory PostOrThread.fromJson(Map<String, dynamic> json) {
    return PostOrThread(
      id: json['id'],
      caption: json['caption'],
      image: json['image'],
      video: json['video'],
      timestamp: json['timestamp'],
      isThread: json['is_thread'],
      views: json['views'],
      user: json['user'],
      likes: json['likes'] != null
          ? List<int>.from(json['likes'].map((x) => x))
          : null,
      postId: json['post_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'caption': caption,
      'image': image,
      'video': video,
      'timestamp': timestamp,
      'is_thread': isThread,
      'views': views,
      'user': user,
      'post_id': postId,
    };
    if (likes != null) {
      data['likes'] = likes;
    }
    return data;
  }
}


