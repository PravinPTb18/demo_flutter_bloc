import 'dart:convert';

List<Comments> commentsFromJson(String str) =>
    List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String commentsToJson(List<Comments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
  Comments({
    required this.postId,
    required this.it,
    required this.name,
    required this.email,
    required this.body,
  });

  int? postId;
  int? it;
  String? name;
  String? email;
  String? body;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        postId: json["postId"],
        it: json["it"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "it": it,
        "name": name,
        "email": email,
        "body": body,
      };
}
