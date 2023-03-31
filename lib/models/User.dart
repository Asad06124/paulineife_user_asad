/// message : "Registration Successful"
/// data : {"id":22,"email":"testing2983@gmail.com","username":"testing389147","firstname":"ali","lastname":"","phone":"12478900","dob":"77/88/0009","website":"","bio":""}
/// errors : {"email":["user with this Email already exists."],"username":["user with this username already exists."],"phone":["user with this phone already exists."]}

class User {
  User({
      String? message, 
      Data? data, 
      Errors? errors,}){
    _message = message;
    _data = data;
    _errors = errors;
}

  User.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  String? _message;
  Data? _data;
  Errors? _errors;
User copyWith({  String? message,
  Data? data,
  Errors? errors,
}) => User(  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  String? get message => _message;
  Data? get data => _data;
  Errors? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }

}

/// email : ["user with this Email already exists."]
/// username : ["user with this username already exists."]
/// phone : ["user with this phone already exists."]

class Errors {
  Errors({
      List<String>? email, 
      List<String>? username, 
      List<String>? phone,}){
    _email = email;
    _username = username;
    _phone = phone;
}

  Errors.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _username = json['username'] != null ? json['username'].cast<String>() : [];
    _phone = json['phone'] != null ? json['phone'].cast<String>() : [];
  }
  List<String>? _email;
  List<String>? _username;
  List<String>? _phone;
Errors copyWith({  List<String>? email,
  List<String>? username,
  List<String>? phone,
}) => Errors(  email: email ?? _email,
  username: username ?? _username,
  phone: phone ?? _phone,
);
  List<String>? get email => _email;
  List<String>? get username => _username;
  List<String>? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['username'] = _username;
    map['phone'] = _phone;
    return map;
  }

}

/// id : 22
/// email : "testing2983@gmail.com"
/// username : "testing389147"
/// firstname : "ali"
/// lastname : ""
/// phone : "12478900"
/// dob : "77/88/0009"
/// website : ""
/// bio : ""

class Data {
  Data({
      num? id, 
      String? email, 
      String? username, 
      String? firstname, 
      String? lastname, 
      String? phone, 
      String? dob, 
      String? website, 
      String? bio,}){
    _id = id;
    _email = email;
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _phone = phone;
    _dob = dob;
    _website = website;
    _bio = bio;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _username = json['username'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _phone = json['phone'];
    _dob = json['dob'];
    _website = json['website'];
    _bio = json['bio'];
  }
  num? _id;
  String? _email;
  String? _username;
  String? _firstname;
  String? _lastname;
  String? _phone;
  String? _dob;
  String? _website;
  String? _bio;
Data copyWith({  num? id,
  String? email,
  String? username,
  String? firstname,
  String? lastname,
  String? phone,
  String? dob,
  String? website,
  String? bio,
}) => Data(  id: id ?? _id,
  email: email ?? _email,
  username: username ?? _username,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  phone: phone ?? _phone,
  dob: dob ?? _dob,
  website: website ?? _website,
  bio: bio ?? _bio,
);
  num? get id => _id;
  String? get email => _email;
  String? get username => _username;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get phone => _phone;
  String? get dob => _dob;
  String? get website => _website;
  String? get bio => _bio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['username'] = _username;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['phone'] = _phone;
    map['dob'] = _dob;
    map['website'] = _website;
    map['bio'] = _bio;
    return map;
  }

}