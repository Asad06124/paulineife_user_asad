class User {
  String image, name;

  User({
    required this.image,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          name == other.name);

  @override
  int get hashCode => image.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'User{' + ' image: $image,' + ' name: $name,' + '}';
  }

  User copyWith({
    String? image,
    String? name,
  }) {
    return User(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': this.image,
      'name': this.name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }
}
