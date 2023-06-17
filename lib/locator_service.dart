import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/feature/data/datasources/category_local_datasource.dart';
import 'package:test_app/feature/data/datasources/category_remote_datasource.dart';
import 'package:test_app/feature/data/datasources/dishes_localo_datasource.dart';
import 'package:test_app/feature/data/datasources/dishes_remote_datasource.dart';
import 'package:test_app/feature/data/repositories/category_repositories_impl.dart';
import 'package:test_app/feature/data/repositories/dishes_repositories_impl.dart';
import 'package:test_app/feature/domain/repository/category_repository.dart';
import 'package:test_app/feature/domain/repository/dishes_repository.dart';
import 'package:test_app/feature/domain/usecases/get_all_category.dart';
import 'package:test_app/feature/domain/usecases/get_all_dishes.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_bloc.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';
import 'package:test_app/feature/presentation/bloc/dishes_list_cubit/dishes_list_cubit.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => DishesListCubit(getAllDishes: sl<GetAllDishes>()));
  sl.registerFactory(() => CategoriesListCubit(getAllCategory: sl<GetAllCategory>()));
  sl.registerFactory(() => CartBloc());
  // UseCases
  sl.registerLazySingleton(
    () => GetAllCategory(sl()),
  );
  sl.registerLazySingleton(
    () => GetAllDishes(sl()),
  );

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategotyRepositoryImpl(
      localDatasource: sl(),
      remoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<CategoryRemoteDatasource>(
    () => CategoryRemoteDatasourceImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<CategoryLocalDatasource>(
    () => CategoryLocalDatasourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<DishesRepository>(
    () => DishesRepositoryImpl(
      localDatasource: sl(),
      networkInfo: sl(),
      remoteDatasource: sl(),
    ),
  );

  sl.registerLazySingleton<DishesRemoteDatasource>(
    () => DishesRemoteDatasourceImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<DishesLocalDatasource>(
    () => DishesLocalDatasourceImpl(
      sharedPreferences: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  
}
