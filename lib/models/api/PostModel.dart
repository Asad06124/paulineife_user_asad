import 'dart:convert';
/// id : 52
/// caption : "normal 2"
/// image : null
/// video : null
/// timestamp : "2023-01-03T15:46:04.110921Z"
/// is_thread : false
/// views : 0
/// user : 12

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
String postModelToJson(PostModel data) => json.encode(data.toJson());
class PostModel {
  PostModel({
      this.id, 
      this.caption, 
      this.image, 
      this.video, 
      this.timestamp, 
      this.isThread, 
      this.views, 
      this.user,});

  PostModel.fromJson(dynamic json) {
    id = json['id'];
    caption = json['caption'];
    image = json['image'];
    video = json['video'];
    timestamp = json['timestamp'];
    isThread = json['is_thread'];
    views = json['views'];
    user = json['user'];
  }
  num? id;
  String? caption;
  dynamic image;
  dynamic video;
  String? timestamp;
  bool? isThread;
  num? views;
  num? user;
PostModel copyWith({  num? id,
  String? caption,
  dynamic image,
  dynamic video,
  String? timestamp,
  bool? isThread,
  num? views,
  num? user,
}) => PostModel(  id: id ?? this.id,
  caption: caption ?? this.caption,
  image: image ?? this.image,
  video: video ?? this.video,
  timestamp: timestamp ?? this.timestamp,
  isThread: isThread ?? this.isThread,
  views: views ?? this.views,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['caption'] = caption;
    map['image'] = image;
    map['video'] = video;
    map['timestamp'] = timestamp;
    map['is_thread'] = isThread;
    map['views'] = views;
    map['user'] = user;
    return map;
  }

}