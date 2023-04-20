import 'dart:convert';
import 'dart:typed_data';
import 'package:paulineife_user/models/api/refresh_post.dart';

import 'PostModel.dart';

class ProfileResponse {
  final Profile profile;
  final bool followed;
  final List<int> ids;
  final List<Post> posts;

  ProfileResponse({
    required this.profile,
    required this.followed,
    required this.ids,
    required this.posts,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    final profileJson = json['profile'] as Map<String, dynamic>;
    // final postJson = json['post'] as Map<String, dynamic>;

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
    Map<String, dynamic> tempJson = {};
    tempJson['ids'] = json['ids'];
    tempJson['data'] = json['post'];

    var posts = RefreshPost.fromJson(tempJson).posts;

    return ProfileResponse(
      profile: profile,
      followed: json['followed'],
      ids: ids,
      posts: posts,
    );
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

  String get fullName => "$firstname $lastname";

  // String get imageUrl {
  //   String url = "$domainUrlWithProtocol$image";
  //   if (url.endsWith('null') || url.endsWith(domainUrlWithProtocol)){
  //     url = userPlaceholder;
  //   }
  //   return url;
  // }

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

