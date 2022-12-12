import 'dart:convert';

class CommentsDto {
  CommentsDto({required this.list});

  List<CommentDto> list;

  factory CommentsDto.fromJson(String str) => CommentsDto.fromDecoded(json.decode(str));

  factory CommentsDto.fromDecoded(dynamic decoded) {
    if (decoded is List) {
      return CommentsDto(list: List<CommentDto>.from(decoded.map((x) => CommentDto.fromMap(x))));
    } else {
      return CommentsDto(list: [CommentDto.fromMap(decoded)]);
    }
  }
}

class CommentDto {
  CommentDto({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory CommentDto.fromJson(String str) => CommentDto.fromMap(json.decode(str));

  factory CommentDto.fromMap(Map<String, dynamic> json) => CommentDto(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
