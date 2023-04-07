class LoginResponse {
  Token? token;
  int? userId;
  String? message;

  LoginResponse({required this.token, this.userId, required this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = Token.fromJson(json['token']);
    userId = json['User_id'];
    message = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token?.toJson();
    data['User_id'] = this.userId;
    data['msg'] = this.message;
    return data;
  }
}

class Token {
  String? refreshToken;
  String? accessToken;

  Token({required this.refreshToken, required this.accessToken});

  Token.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refresh'];
    accessToken = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refreshToken;
    data['access'] = this.accessToken;
    return data;
  }
}
