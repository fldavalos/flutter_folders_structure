import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

class Comment extends BaseEntity {
  Comment({
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
}
