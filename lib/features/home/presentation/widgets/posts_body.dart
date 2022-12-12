import 'package:flutter/material.dart';

import 'package:flutter_folders_structure/features/home/domain/entity/post.dart';

class PostsBody extends StatelessWidget {
  final List<Post> entities;
  const PostsBody({Key? key, required this.entities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entities.length,
        itemBuilder: (context, index) {
          final title = '#${entities[index].id} - ${entities[index].title} (User: ${entities[index].userId})';
          final subtitle = entities[index].body;
          return ListTile(title: Text(title), subtitle: Text(subtitle));
        });
  }
}
