class Users {
  String id, name, email, password, confirmPassword, gender, notification, profileImageURL, address, fiverID, upworkID, freelanceID;
  int timeStamp;
  bool approved = false;
  bool declined = false;
  bool blocked = false;
  bool postNotifi = false;
  bool UpdateNotifi = false;

//<editor-fold desc="Data Methods">

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.notification,
    required this.profileImageURL,
    required this.address,
    required this.fiverID,
    required this.upworkID,
    required this.freelanceID,
    required this.timeStamp,
    required this.approved,
    required this.declined,
    required this.blocked,
    required this.postNotifi,
    required this.UpdateNotifi,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Users &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          confirmPassword == other.confirmPassword &&
          gender == other.gender &&
          notification == other.notification &&
          profileImageURL == other.profileImageURL &&
          address == other.address &&
          fiverID == other.fiverID &&
          upworkID == other.upworkID &&
          freelanceID == other.freelanceID &&
          timeStamp == other.timeStamp &&
          approved == other.approved &&
          declined == other.declined &&
          blocked == other.blocked &&
          postNotifi == other.postNotifi &&
          UpdateNotifi == other.UpdateNotifi);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode ^
      gender.hashCode ^
      notification.hashCode ^
      profileImageURL.hashCode ^
      address.hashCode ^
      fiverID.hashCode ^
      upworkID.hashCode ^
      freelanceID.hashCode ^
      timeStamp.hashCode ^
      approved.hashCode ^
      declined.hashCode ^
      blocked.hashCode ^
      postNotifi.hashCode ^
      UpdateNotifi.hashCode;

  @override
  String toString() {
    return 'Users{' +
        ' id: $id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' password: $password,' +
        ' confirmPassword: $confirmPassword,' +
        ' gender: $gender,' +
        ' notification: $notification,' +
        ' profileImageURL: $profileImageURL,' +
        ' address: $address,' +
        ' fiverID: $fiverID,' +
        ' upworkID: $upworkID,' +
        ' freelanceID: $freelanceID,' +
        ' timeStamp: $timeStamp,' +
        ' approved: $approved,' +
        ' declined: $declined,' +
        ' blocked: $blocked,' +
        ' postNotifi: $postNotifi,' +
        ' UpdateNotifi: $UpdateNotifi,' +
        '}';
  }

  Users copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? gender,
    String? notification,
    String? profileImageURL,
    String? address,
    String? fiverID,
    String? upworkID,
    String? freelanceID,
    int? timeStamp,
    bool? approved,
    bool? declined,
    bool? blocked,
    bool? postNotifi,
    bool? UpdateNotifi,
  }) {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      gender: gender ?? this.gender,
      notification: notification ?? this.notification,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      address: address ?? this.address,
      fiverID: fiverID ?? this.fiverID,
      upworkID: upworkID ?? this.upworkID,
      freelanceID: freelanceID ?? this.freelanceID,
      timeStamp: timeStamp ?? this.timeStamp,
      approved: approved ?? this.approved,
      declined: declined ?? this.declined,
      blocked: blocked ?? this.blocked,
      postNotifi: postNotifi ?? this.postNotifi,
      UpdateNotifi: UpdateNotifi ?? this.UpdateNotifi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'confirmPassword': this.confirmPassword,
      'gender': this.gender,
      'notification': this.notification,
      'profileImageURL': this.profileImageURL,
      'address': this.address,
      'fiverID': this.fiverID,
      'upworkID': this.upworkID,
      'freelanceID': this.freelanceID,
      'timeStamp': this.timeStamp,
      'approved': this.approved,
      'declined': this.declined,
      'blocked': this.blocked,
      'postNotifi': this.postNotifi,
      'UpdateNotifi': this.UpdateNotifi,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      gender: map['gender'] as String,
      notification: map['notification'] as String,
      profileImageURL: map['profileImageURL'] as String,
      address: map['address'] as String,
      fiverID: map['fiverID'] as String,
      upworkID: map['upworkID'] as String,
      freelanceID: map['freelanceID'] as String,
      timeStamp: map['timeStamp'] as int,
      approved: map['approved'] as bool,
      declined: map['declined'] as bool,
      blocked: map['blocked'] as bool,
      postNotifi: map['postNotifi'] as bool,
      UpdateNotifi: map['UpdateNotifi'] as bool,
    );
  }

//</editor-fold>
}
