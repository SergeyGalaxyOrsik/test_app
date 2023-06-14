import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/domain/usecases/get_all_dishes.dart';
import 'package:test_app/feature/presentation/bloc/dishes_list_cubit/dishes_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';
const UNEXPECTED_FAILURE_MESSAGE = 'Unexpected Failure';

class DishesListCubit extends Cubit<DishesState> {
  final GetAllDishes getAllDishes;

  DishesListCubit({required this.getAllDishes}) : super(DishesEmpty());

  void loadDishe() async {
    if(state is DishesLoading) return;

    final currentState = state;

    var oldDishe = <DishesEntity>[];
    if(currentState is DishesLoaded) {
      oldDishe = currentState.dishesList;
    }

    emit(DishesLoading(oldDishe));

    final failureOrDishe = await getAllDishes();
    failureOrDishe.fold((error) => DishesError(message: _mapFailureToMessage(error)), (dishe) {
      final dishes = (state as DishesLoading).oldDishesList;
      dishes.addAll(dishes);
      emit(DishesLoaded(dishes));
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