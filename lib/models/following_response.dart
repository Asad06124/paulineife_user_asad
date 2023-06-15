class FollowingResponse {
  int count;
  String? next;
  String? previous;
  List<FollowingUser> results;

  FollowingResponse({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  factory FollowingResponse.fromJson(Map<String, dynamic> json) {
    return FollowingResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<FollowingUser>.from(
        json['results'].map((user) => FollowingUser.fromJson(user)),
      ),
    );
  }
}

class FollowingUser {
  String username;
  String image;

  FollowingUser({
    required this.username,
    required this.image,
  });

  factory FollowingUser.fromJson(Map<String, dynamic> json) {
    return FollowingUser(
      username: json['username'],
      image: json['image'],
    );
  }
}
