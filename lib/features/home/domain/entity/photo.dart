import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

class Photo extends BaseEntity {
  Photo({
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
}
