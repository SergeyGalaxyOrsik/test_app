import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/feature/data/datasources/dishes_localo_datasource.dart';
import 'package:test_app/feature/data/datasources/dishes_remote_datasource.dart';
import 'package:test_app/feature/data/models/dishes_model.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/domain/repository/dishes_repository.dart';

class DishesRepositoryImpl implements DishesRepository {
  final DishesRemoteDatasource remoteDatasource;
  final DishesLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  DishesRepositoryImpl({
    required this.localDatasource,
    required this.networkInfo,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<DishesEntity>>> getAllDishes() async {
    return await _getDishes(() {
      return remoteDatasource.getAllDishes();
    });
  }

  Future<Either<Failure, List<DishesModel>>> _getDishes(
      Future<List<DishesModel>> Function() getDishes) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDishe = await getDishes();
        localDatasource.dishesToCache(remoteDishe);
        return Right(remoteDishe);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDishe = await localDatasource.getLastDishesFromCache();
        return Right(localDishe);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
