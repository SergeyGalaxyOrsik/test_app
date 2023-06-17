import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/models/dishes_model.dart';
import 'dart:convert';

abstract class DishesLocalDatasource {
  /// Gets the cached [List<DishesModel>] wich was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CachedException] if no cached data is present
  ///
  Future<List<DishesModel>> getLastDishesFromCache();

  Future<void> dishesToCache(List<DishesModel> dishes);
}

const CACHED_DISHES_LIST = 'CACHED_DISHES_LIST';

class DishesLocalDatasourceImpl implements DishesLocalDatasource {
  final SharedPreferences sharedPreferences;

  DishesLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<void> dishesToCache(List<DishesModel> dishes) {
    final List<String> jsonDishesList =
        dishes.map((dishe) => json.encode(dishe.toJson())).toList();

    sharedPreferences.setStringList(CACHED_DISHES_LIST, jsonDishesList);

    return Future.value(jsonDishesList);
  }

  @override
  Future<List<DishesModel>> getLastDishesFromCache() {
    final jsonDishesList = sharedPreferences.getStringList(CACHED_DISHES_LIST);
    if (jsonDishesList!.isNotEmpty) {
      return Future.value(jsonDishesList
          .map((dishe) => DishesModel.fromJson(json.decode(dishe)))
          .toList());
    } else {
      throw CacheException();
    }
  }
}
