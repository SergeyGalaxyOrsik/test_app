import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/domain/repository/dishes_repository.dart';


class GetAllDishes extends UseCase<List<DishesEntity>>{
  final DishesRepository dishesRepository;

  GetAllDishes(this.dishesRepository);

  @override
  Future<Either<Failure, List<DishesEntity>>> call() async {
    return await dishesRepository.getAllDishes();
  }
}