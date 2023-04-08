class SearchUser {
  String image, username;

  SearchUser({
    required this.image,
    required this.username,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchUser &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          username == other.username);

  @override
  int get hashCode => image.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'User{' + ' image: $image,' + ' username: $username,' + '}';
  }

  SearchUser copyWith({
    String? image,
    String? username,
  }) {
    return SearchUser(
      image: image ?? this.image,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': this.image,
      'username': this.username,
    };
  }

  factory SearchUser.fromMap(Map<String, dynamic> map) {
    return SearchUser(
      image: map['image'] as String,
      username: map['username'] as String,
    );
  }
}
