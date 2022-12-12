import 'package:http/http.dart';

import 'package:flutter_folders_structure/features/home/data/dto/albums_dto.dart';
import 'package:flutter_folders_structure/features/home/data/dto/comments_dto.dart';
import 'package:flutter_folders_structure/features/home/data/dto/posts_dto.dart';
import 'package:flutter_folders_structure/features/home/data/dto/photos_dto.dart';
import 'package:flutter_folders_structure/features/home/data/dto/users_dto.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/album.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/comment.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/photo.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/post.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/user.dart';

class HomeRemoteDatasource {
  static HomeRemoteDatasource? _instance;
  static HomeRemoteDatasource get instance {
    _instance ??= HomeRemoteDatasource();
    return _instance!;
  }

  final _client = Client();

  Future<List<BaseEntity>> get<T>() async {
    final response = await _client.get(Uri(
      scheme: "https",
      host: "jsonplaceholder.typicode.com",
      path: _resolvePath<T>(),
    ));
    final entities = _resolveDtoToEntities<T>(response.body);

    return entities;
  }

  Future<List<BaseEntity>> getById<T, U>(U id) async {
    final response = await _client.get(Uri(
      scheme: "https",
      host: "jsonplaceholder.typicode.com",
      path: _resolvePath<T>(),
    ));
    final entities = _resolveDtoToEntities<T>(response.body);

    return entities;
  }

  String _resolvePath<T>() {
    String path;
    String stringType = T.toString();

    switch (stringType) {
      case 'Post':
        path = 'posts';
        break;
      case 'Comment':
        path = 'comments';
        break;
      case 'Album':
        path = 'albums';
        break;
      case 'Photo':
        path = 'photos';
        break;
      default:
        path = 'users';
    }

    return path;
  }

  List<BaseEntity> _resolveDtoToEntities<T>(String json) {
    List<BaseEntity> entities;
    String stringType = T.toString();

    switch (stringType) {
      case 'Post':
        var dto = PostsDto.fromJson(json);
        entities = dto.list
            .map((e) => Post(
                  userId: e.userId,
                  id: e.id,
                  title: e.title,
                  body: e.body,
                ))
            .toList();
        break;
      case 'Comment':
        var dto = CommentsDto.fromJson(json);
        entities = dto.list
            .map((e) => Comment(
                  postId: e.postId,
                  id: e.id,
                  name: e.name,
                  email: e.email,
                  body: e.body,
                ))
            .toList();
        break;
      case 'Album':
        var dto = AlbumsDto.fromJson(json);
        entities = dto.list
            .map((e) => Album(
                  userId: e.userId,
                  id: e.id,
                  title: e.title,
                ))
            .toList();
        break;
      case 'Photo':
        var dto = PhotosDto.fromJson(json);
        entities = dto.list
            .map((e) => Photo(
                  albumId: e.albumId,
                  id: e.id,
                  title: e.title,
                  url: e.url,
                  thumbnailUrl: e.thumbnailUrl,
                ))
            .toList();
        break;
      default:
        var dto = UsersDto.fromJson(json);
        entities = dto.list
            .map((e) => User(
                  id: e.id,
                  name: e.name,
                  username: e.username,
                  email: e.email,
                  address: Address(
                    street: e.address.street,
                    suite: e.address.suite,
                    city: e.address.city,
                    zipcode: e.address.zipcode,
                    geo: Geo(
                      lat: e.address.geo.lat,
                      lng: e.address.geo.lng,
                    ),
                  ),
                  phone: e.phone,
                  website: e.website,
                  company: Company(
                    name: e.company.name,
                    catchPhrase: e.company.catchPhrase,
                    bs: e.company.bs,
                  ),
                ))
            .toList();
    }

    return entities;
  }
}
