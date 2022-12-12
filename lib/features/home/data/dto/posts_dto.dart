import 'dart:convert';

class PostsDto {
  PostsDto({required this.list});

  List<PostDto> list;

  factory PostsDto.fromJson(String str) => PostsDto.fromDecoded(json.decode(str));

  factory PostsDto.fromDecoded(dynamic decoded) {
    if (decoded is List) {
      return PostsDto(list: List<PostDto>.from(decoded.map((x) => PostDto.fromMap(x))));
    } else {
      return PostsDto(list: [PostDto.fromMap(decoded)]);
    }
  }
}

class PostDto {
  PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostDto.fromJson(String str) => PostDto.fromMap(json.decode(str));

  factory PostDto.fromMap(Map<String, dynamic> json) => PostDto(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
