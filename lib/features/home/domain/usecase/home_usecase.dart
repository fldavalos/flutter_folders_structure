import 'package:flutter_folders_structure/features/home/data/repository/home_repository.dart';
import 'package:flutter_folders_structure/features/home/domain/entity/base_entity.dart';

class HomeUseCase {
  static Future<List<BaseEntity>> get<T>() async {
    return await HomeRepository.get<T>();
  }

  static Future<List<BaseEntity>> getById<T, U>(U id) async {
    return await HomeRepository.getById<T, U>(id);
  }
}
