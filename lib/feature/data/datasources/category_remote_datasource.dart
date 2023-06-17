import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CategoryRemoteDatasource {
  Future<List<CategoryModel>> getAllCategory();
}

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final http.Client client;

  CategoryRemoteDatasourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getAllCategory() => _getCategoryFromUrl('https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54');

  Future<List<CategoryModel>> _getCategoryFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final categories = json.decode(response.body);
      return (categories['сategories'] as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
