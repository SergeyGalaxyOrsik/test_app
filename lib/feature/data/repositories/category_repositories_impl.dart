import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/feature/data/datasources/category_local_datasource.dart';
import 'package:test_app/feature/data/datasources/category_remote_datasource.dart';
import 'package:test_app/feature/data/models/category_model.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/domain/repository/category_repository.dart';

class CategotyRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource remoteDatasource;
  final CategoryLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  CategotyRepositoryImpl({
    required this.localDatasource,
    required this.networkInfo,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategory() async {
    return await _getCategories(() {
      return remoteDatasource.getAllCategory();
    });
  }

  Future<Either<Failure, List<CategoryModel>>> _getCategories(
      Future<List<CategoryModel>> Function() getCategories) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await getCategories();
        localDatasource.categoriesToCache(remoteCategory);
        return Right(remoteCategory);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCategories =
            await localDatasource.getLastCategoriesFromCache();
        return Right(localCategories);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
