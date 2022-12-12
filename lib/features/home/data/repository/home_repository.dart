import 'package:flutter_folders_structure/features/home/data/data_sources/home_remote_datasource.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

class HomeRepository {
  static Future<List<BaseEntity>> get<T>() async {
    final entities = await HomeRemoteDatasource.instance.get<T>();
    return entities;
  }

  static Future<List<BaseEntity>> getById<T, U>(U id) async {
    final entity = await HomeRemoteDatasource.instance.getById<T, U>(id);
    return entity;
  }
}
