import 'package:test_app/feature/data/models/dishes_model.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';

class CartState {
  final List<DishesEntity> cartItems;
  CartState(this.cartItems);
  
}