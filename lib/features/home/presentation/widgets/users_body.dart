import 'package:flutter/material.dart';

import 'package:flutter_folders_structure/features/home/domain/entity/user.dart';

class UsersBody extends StatelessWidget {
  final List<User> entities;
  const UsersBody({Key? key, required this.entities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entities.length,
        itemBuilder: (context, index) {
          final title = '#${entities[index].id} ${entities[index].name} (Username ${entities[index].username})';
          final subtitle = entities[index].website;
          return ListTile(title: Text(title), subtitle: Text(subtitle));
        });
  }
}
