import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/data/models/dishes_model.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_bloc.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_event.dart';

class DishesFullCard extends StatelessWidget {
  final DishesEntity dishe;
  const DishesFullCard({required this.dishe});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.cellBackground),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Image.network(
                      dishe.image_url,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.heart,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(40, 40),
                            backgroundColor: AppColors.mainBackground),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(40, 40),
                            backgroundColor: AppColors.mainBackground),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${dishe.name}',
              style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '${dishe.weight}₽ · ',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${dishe.weight}г',
                  style: TextStyle(
                      fontFamily: 'SFPro Display',
                      fontSize: 14,
                      color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${dishe.description}',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final cartBloc = context.read<CartBloc>();
                final cartItems = cartBloc.state.cartItems;
                
                if (cartItems.any((item) => item.id == dishe.id)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Блюдо уже добавлено в карзину'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  cartBloc.add(AddToCart(dishe));
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Блюдо добавлено в карзину'),
                    duration: Duration(seconds: 2),
                  ),
                );
                }
                
              },
              child: Text(
                'Добавить в корзину',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.accentColor,
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  48,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
