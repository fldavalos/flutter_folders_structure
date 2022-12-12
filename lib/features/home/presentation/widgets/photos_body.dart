import 'package:flutter/material.dart';

import 'package:flutter_folders_structure/features/home/domain/entity/photo.dart';

class PhotosBody extends StatelessWidget {
  final List<Photo> entities;
  const PhotosBody({Key? key, required this.entities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entities.length,
        itemBuilder: (context, index) {
          final title = '#${entities[index].id} ${entities[index].title} (Album ${entities[index].albumId})';
          final subtitle = entities[index].url;
          return ListTile(title: Text(title), subtitle: Text(subtitle));
        });
  }
}
