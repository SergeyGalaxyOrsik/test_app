import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/models/dishes_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class DishesRemoteDatasource {
  Future<List<DishesModel>> getAllDishes();
}

class DishesRemoteDatasourceImpl implements DishesRemoteDatasource {
  final http.Client client;
  DishesRemoteDatasourceImpl({required this.client});

  @override
  Future<List<DishesModel>> getAllDishes() async {
    final response = await client.get(
      Uri.parse('https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final dishes = json.decode(response.body);
      return (dishes['dishes'] as List).map((dishes) => DishesModel.fromJson(dishes)).toList();
    } else {
      throw ServerException();
    }
  }
}
