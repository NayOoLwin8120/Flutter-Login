import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class Post {
  final int UserId;
  final String id;
  final String? title;
  final String? body;


  Post({required this.id, required this.title,required this.UserId,required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      UserId: json['userId'] is int ? json['userId'] : int.parse(json['userId']),
      id: json['id'].toString(),
      title: json['title'].toString(),
      body: json['body'].toString(),
    );
  }

}

