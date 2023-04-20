class FollowingResponse {
  final int count;
  final String next;
  final String previous;
  final List<FollowingResult> results;

  FollowingResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory FollowingResponse.fromJson(Map<String, dynamic> json) {
    var results = json['results'] as List;
    List<FollowingResult> followingResults =
    results.map((i) => FollowingResult.fromJson(i)).toList();

    return FollowingResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: followingResults,
    );
  }
}

class FollowingResult {
  final String username;
  final String image;

  FollowingResult({
    required this.username,
    required this.image,
  });

  factory FollowingResult.fromJson(Map<String, dynamic> json) {
    return FollowingResult(
      username: json['username'],
      image: json['image'],
    );
  }
}
