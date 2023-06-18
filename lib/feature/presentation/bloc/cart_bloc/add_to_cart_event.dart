import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';

abstract class CartEvent extends Equatable {
  
  @override
  List<Object?> get props => [];

}

class AddToCart extends CartEvent {
  final DishesEntity dishes;
  AddToCart(this.dishes);

  @override
  List<Object?> get props => [dishes];
}

class RemoveFromCart extends CartEvent {
  final DishesEntity dishes;

  RemoveFromCart(this.dishes);

  @override
  List<Object?> get props => [dishes];
}