import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

class Album extends BaseEntity {
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;
}
