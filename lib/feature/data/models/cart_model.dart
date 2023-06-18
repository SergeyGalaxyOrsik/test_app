import 'package:equatable/equatable.dart';
import 'package:test_app/feature/data/models/dishes_model.dart';

class Cart extends Equatable {
  final List<DishesModel> dishes;

  const Cart({this.dishes = const <DishesModel>[]});

  @override
  List<Object?> get props => [dishes];

}