import 'package:flutter/material.dart';

import 'package:flutter_folders_structure/features/home/domain/entity/album.dart';

class AlbumsBody extends StatelessWidget {
  final List<Album> entities;
  const AlbumsBody({Key? key, required this.entities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entities.length,
        itemBuilder: (context, index) {
          final title = '#${entities[index].id} (User ${entities[index].userId})';
          final subtitle = entities[index].title;
          return ListTile(title: Text(title), subtitle: Text(subtitle));
        });
  }
}
