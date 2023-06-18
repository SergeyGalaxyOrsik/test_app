import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/domain/usecases/get_all_category.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_state.dart';

// ignore: constant_identifier_names
const SERVER_FAILURE_MESSAGE = 'Server Failure';
// ignore: constant_identifier_names
const CACHED_FAILURE_MESSAGE = 'Cache Failure';
// ignore: constant_identifier_names
const UNEXPECTED_FAILURE_MESSAGE = 'Unexpected Failure';

class CategoriesListCubit extends Cubit<CategoriesState> {
  final GetAllCategory getAllCategory;

  CategoriesListCubit({required this.getAllCategory}) : super(CategoriesEmpty());

  void loadCategories() async {
    if(state is CategoriesLoading) return;

    final currentState = state;
    var oldCategory = <CategoryEntity>[];
    if(currentState is CategoriesLoaded){
      oldCategory = currentState.categoriesList;
    }

    emit(CategoriesLoading(oldCategory));

    final failureOrCategory = await getAllCategory();
    failureOrCategory.fold((error) => CategoriesError(message: _mapFailureToMessage(error)), (category) {
      final categories = (state as CategoriesLoading).oldCategoriesList;
      categories.addAll(category);
      emit(CategoriesLoaded(categories));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
      return CACHED_FAILURE_MESSAGE;
      default:
      return UNEXPECTED_FAILURE_MESSAGE;
    }
  }  

}