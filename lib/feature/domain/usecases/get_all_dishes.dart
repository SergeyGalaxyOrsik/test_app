import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/domain/repository/dishes_repository.dart';


class GetAllDishes {
  final DishesRepository dishesRepository;

  GetAllDishes(this.dishesRepository);

  Future<Either<Failure, List<DishesEntity>>> call() async {
    return await dishesRepository.getAllDishes();
  }
}