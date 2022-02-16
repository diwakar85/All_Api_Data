import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));
String commentToJson(Comment data) => json.encode(data.toJson());
class Comment {
  Comment({
      this.postId, 
      this.id, 
      this.name, 
      this.email, 
      this.body,});

  Comment.fromJson(dynamic json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['body'] = body;
    return map;
  }

}