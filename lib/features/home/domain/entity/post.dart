import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

class Post extends BaseEntity {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;
}
