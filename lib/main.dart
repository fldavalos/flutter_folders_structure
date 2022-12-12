import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_folders_structure/core/styles/custom_style.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_folders_structure/features/home/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: ((context) => HomeBloc(HomeViewInitialState())),
          child: const HomeScreen(),
        ),
      ],
      child: MaterialApp(
        title: 'My App Demo',
        theme: CustomStyle.themeData,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
