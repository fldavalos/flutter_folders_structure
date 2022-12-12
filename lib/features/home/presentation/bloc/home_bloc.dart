import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_folders_structure/features/home/domain/entity/album.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/comment.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/photo.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/post.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/user.dart';
import 'package:flutter_folders_structure/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_event.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeViewInitialState initialState) : super(initialState) {
    on<HomeViewPostsEvent>((event, emit) async {
      emit(HomeViewFetchingState());
      var posts = await HomeUseCase.get<Post>();
      emit(HomeViewFetchingCompletedState(posts));
    });
    on<HomeViewCommentsEvent>((event, emit) async {
      emit(HomeViewFetchingState());
      var comments = await HomeUseCase.get<Comment>();
      emit(HomeViewFetchingCompletedState(comments));
    });
    on<HomeViewAlbumsEvent>((event, emit) async {
      emit(HomeViewFetchingState());
      var albums = await HomeUseCase.get<Album>();
      emit(HomeViewFetchingCompletedState(albums));
    });
    on<HomeViewPhotosEvent>((event, emit) async {
      emit(HomeViewFetchingState());
      var photos = await HomeUseCase.get<Photo>();
      emit(HomeViewFetchingCompletedState(photos));
    });
    on<HomeViewUsersEvent>((event, emit) async {
      emit(HomeViewFetchingState());
      var users = await HomeUseCase.get<User>();
      emit(HomeViewFetchingCompletedState(users));
    });
  }
}
