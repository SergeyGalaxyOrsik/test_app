import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/domain/repository/category_repository.dart';

class GetAllCategory {
  final CategoryRepository categoryRepository;

  GetAllCategory(this.categoryRepository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await categoryRepository.getAllCategory();
  }

}