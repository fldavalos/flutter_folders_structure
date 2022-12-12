import 'dart:convert';

class AlbumsDto {
  AlbumsDto({required this.list});

  List<AlbumDto> list;

  factory AlbumsDto.fromJson(String str) => AlbumsDto.fromDecoded(json.decode(str));

  factory AlbumsDto.fromDecoded(dynamic decoded) {
    if (decoded is List) {
      return AlbumsDto(list: List<AlbumDto>.from(decoded.map((x) => AlbumDto.fromMap(x))));
    } else {
      return AlbumsDto(list: [AlbumDto.fromMap(decoded)]);
    }
  }
}

class AlbumDto {
  AlbumDto({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory AlbumDto.fromJson(String str) => AlbumDto.fromMap(json.decode(str));

  factory AlbumDto.fromMap(Map<String, dynamic> json) => AlbumDto(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );
}
