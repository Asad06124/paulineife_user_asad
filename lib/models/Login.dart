class LoginResponse {
  String refreshToken;
  String accessToken;
  int userId;
  String message;
  String username;
  String image;


  LoginResponse({
    required this.refreshToken,
    required this.accessToken,
    required this.userId,
    required this.message,
    required this.username,
    required this.image,
  });


  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      refreshToken: json['token']['refresh'],
      accessToken: json['token']['access'],
      userId: json['User_id'],
      message: json['msg'],
      username: json['Username'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': {'refresh': refreshToken, 'access': accessToken},
    'User_id': userId,
    'msg': message,
    'Username': username,
    'image': image,
  };
}
