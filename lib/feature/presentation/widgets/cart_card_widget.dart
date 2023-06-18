import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_bloc.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_event.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_state.dart';

class CartCards extends StatefulWidget {
  final VoidCallback notifyParent;
  const CartCards({super.key, required this.notifyParent});

  @override
  State<CartCards> createState() => _CartCardsState();
}

class _CartCardsState extends State<CartCards> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.cartItems.isEmpty) {
          return const Center(
            child: Text(
              'Корзина пуста',
              style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 16),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                if (state.cartItems[index].count != null &&
                    state.cartItems[index].count == 0) {
                  final cartBloc = BlocProvider.of<CartBloc>(context);
                  cartBloc.add(RemoveFromCart(state.cartItems[index]));
                  state.cartItems[index].count == 1;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: AppColors.cellBackground,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                state.cartItems[index].image_url,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.cartItems[index].name,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${state.cartItems[index].price}₽ · ',
                                    style: const TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${state.cartItems[index].weight}г',
                                    style: const TextStyle(
                                        fontFamily: 'SFPro Display',
                                        fontSize: 14,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(239, 238, 236, 1)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    state.cartItems[index].count =
                                        (state.cartItems[index].count! - 1);
                                    state.cartItems[index].cartPrice =
                                        (state.cartItems[index].cartPrice! -
                                            state.cartItems[index].price);
                                    widget.notifyParent();
                                  },
                                );
                              },
                              icon: const Icon(
                                CupertinoIcons.minus,
                                size: 24,
                              ),
                            ),
                            Text('${state.cartItems[index].count}'),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  state.cartItems[index].count =
                                      (state.cartItems[index].count! + 1);
                                  state.cartItems[index].cartPrice =
                                      (state.cartItems[index].cartPrice! +
                                          state.cartItems[index].price);
                                  widget.notifyParent();
                                  // widget.notifyParent;
                                });
                              },
                              icon: const Icon(
                                CupertinoIcons.plus,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
