import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/data/models/dishes_model.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_event.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<CartEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(CartEvent event, Emitter<CartState> emit)  async{
    if (event is AddToCart) {
      final updateCart = List<DishesEntity>.from(state.cartItems)..add(event.dishes);
      emit(CartState(updateCart));
    } else if (event is RemoveFromCart) {
      final updateCart = List<DishesEntity>.from(state.cartItems)..remove(event.dishes);
      emit(CartState(updateCart));
    }
  }
}
