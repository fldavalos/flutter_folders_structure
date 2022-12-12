import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

abstract class HomeState {}

class HomeViewInitialState extends HomeState {}

class HomeViewFetchingState extends HomeState {}

class HomeViewFetchingCompletedState extends HomeState {
  final List<BaseEntity> entities;
  HomeViewFetchingCompletedState(this.entities);
}

class HomeViewFetchingErrorState extends HomeState {}
