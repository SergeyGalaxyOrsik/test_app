import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';

abstract class DishesState extends Equatable {
  const DishesState();
  @override
  List<Object?> get props => [];
}

class DishesEmpty extends DishesState {
  @override
  List<Object?> get props => [];
}

class DishesLoading extends DishesState {
  final List<DishesEntity> oldDishesList;
  

  DishesLoading(this.oldDishesList);

  @override
  List<Object?> get props => [oldDishesList];
  
}

class DishesLoaded extends DishesState {
  final List<DishesEntity> dishesList;

  DishesLoaded(this.dishesList);

  @override
  List<Object?> get props => [dishesList];

}

class DishesError extends DishesState {
  final String message;

  DishesError({required this.message});
  
  @override
  List<Object?> get props => [message];
}