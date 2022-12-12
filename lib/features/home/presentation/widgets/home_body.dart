import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_folders_structure/core/styles/custom_style.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/album.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/comment.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/photo.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/post.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/user.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_event.dart';
import 'package:flutter_folders_structure/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_folders_structure/features/home/presentation/widgets/albums_body.dart';
import 'package:flutter_folders_structure/features/home/presentation/widgets/comments_body.dart';
import 'package:flutter_folders_structure/features/home/presentation/widgets/photos_body.dart';
import 'package:flutter_folders_structure/features/home/presentation/widgets/posts_body.dart';
import 'package:flutter_folders_structure/features/home/presentation/widgets/users_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder(
      bloc: homeBloc,
      builder: (BuildContext context, state) {
        if (state is HomeViewFetchingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeViewFetchingCompletedState) {
          String stringType = state.entities.runtimeType.toString();

          switch (stringType) {
            case 'List<Post>':
              return PostsBody(entities: state.entities as List<Post>);
            case 'List<Comment>':
              return CommentsBody(entities: state.entities as List<Comment>);
            case 'List<Album>':
              return AlbumsBody(entities: state.entities as List<Album>);
            case 'List<Photo>':
              return PhotosBody(entities: state.entities as List<Photo>);
            default:
              return UsersBody(entities: state.entities as List<User>);
          }
        } else if (state is HomeViewFetchingErrorState) {
          return const Center(child: Text('Error!'));
        } else {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: CustomStyle.homeBackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () => homeBloc.add(HomeViewPostsEvent()),
                  icon: const Icon(Icons.list),
                  label: const Text('View Posts'),
                ),
                TextButton.icon(
                  onPressed: () => homeBloc.add(HomeViewCommentsEvent()),
                  icon: const Icon(Icons.comment),
                  label: const Text('View Comments'),
                ),
                TextButton.icon(
                  onPressed: () => homeBloc.add(HomeViewAlbumsEvent()),
                  icon: const Icon(Icons.photo_album),
                  label: const Text('View Albums'),
                ),
                TextButton.icon(
                  onPressed: () => homeBloc.add(HomeViewPhotosEvent()),
                  icon: const Icon(Icons.photo),
                  label: const Text('View Photos'),
                ),
                TextButton.icon(
                  onPressed: () => homeBloc.add(HomeViewUsersEvent()),
                  icon: const Icon(Icons.people),
                  label: const Text('View Users'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
