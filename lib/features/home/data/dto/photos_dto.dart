import 'dart:convert';

class PhotosDto {
  PhotosDto({required this.list});

  List<PhotoDto> list;

  factory PhotosDto.fromJson(String str) => PhotosDto.fromDecoded(json.decode(str));

  factory PhotosDto.fromDecoded(dynamic decoded) {
    if (decoded is List) {
      return PhotosDto(list: List<PhotoDto>.from(decoded.map((x) => PhotoDto.fromMap(x))));
    } else {
      return PhotosDto(list: [PhotoDto.fromMap(decoded)]);
    }
  }
}

class PhotoDto {
  PhotoDto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoDto.fromJson(String str) => PhotoDto.fromMap(json.decode(str));

  factory PhotoDto.fromMap(Map<String, dynamic> json) => PhotoDto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
