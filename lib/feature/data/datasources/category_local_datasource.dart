import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/models/category_model.dart';
import 'dart:convert';

abstract class CategoryLocalDatasource {
  /// Gets the cached [List<CategoryModel>] wich was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CachedException] if no cached data is present
  ///
  Future<List<CategoryModel>> getLastCategoriesFromCache();
  Future<void> categoriesToCache(List<CategoryModel> categories);
}

// ignore: constant_identifier_names
const CACHED_CATEGORIES_LIST = 'CACHED_CATEGORIES_LIST';

class CategoryLocalDatasourceImpl implements CategoryLocalDatasource {
  final SharedPreferences sharedPreferences;

  CategoryLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<List<String>> categoriesToCache(List<CategoryModel> categories) {
    final List<String> jsonCategoryList =
        categories.map((category) => json.encode(category.toJson())).toList();

    sharedPreferences.setStringList(CACHED_CATEGORIES_LIST, jsonCategoryList);
    return Future.value(jsonCategoryList);
  }

  @override
  Future<List<CategoryModel>> getLastCategoriesFromCache() {
    final jsonCategoryList =
        sharedPreferences.getStringList(CACHED_CATEGORIES_LIST);
    if (jsonCategoryList!.isNotEmpty) {
      return Future.value(jsonCategoryList
          .map((category) => CategoryModel.fromJson(json.decode(category)))
          .toList());
    } else {
      throw CacheException();
    }
  }
}
