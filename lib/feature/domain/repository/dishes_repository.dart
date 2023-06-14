import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';

abstract class DishesRepository {
  Future<Either<Failure, List<DishesEntity>>> getAllDishes();
}