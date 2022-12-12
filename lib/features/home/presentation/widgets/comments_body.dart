import 'package:flutter/material.dart';

import 'package:flutter_folders_structure/features/home/domain/entity/comment.dart';

class CommentsBody extends StatelessWidget {
  final List<Comment> entities;
  const CommentsBody({Key? key, required this.entities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entities.length,
        itemBuilder: (context, index) {
          final title = '#${entities[index].id} ${entities[index].name} (Post ${entities[index].postId})';
          final subtitle = entities[index].body;
          return ListTile(title: Text(title), subtitle: Text(subtitle));
        });
  }
}
