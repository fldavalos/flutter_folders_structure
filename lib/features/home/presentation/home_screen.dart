import 'package:flutter/material.dart';

import 'package:flutter_folders_structure/features/home/presentation/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home Screen')), body: const HomeBody());
  }
}
