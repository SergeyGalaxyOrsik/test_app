import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/domain/repository/category_repository.dart';

class GetAllCategory extends UseCase<List<CategoryEntity>>{
  final CategoryRepository categoryRepository;

  GetAllCategory(this.categoryRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await categoryRepository.getAllCategory();
  }
}
