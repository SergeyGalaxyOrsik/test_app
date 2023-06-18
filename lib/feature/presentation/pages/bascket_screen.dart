import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_bloc.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_state.dart';
import 'package:test_app/feature/presentation/widgets/cart_card_widget.dart';

class BuscketPage extends StatefulWidget {
  const BuscketPage({super.key});

  @override
  State<BuscketPage> createState() => _BuscketPageState();
}

class _BuscketPageState extends State<BuscketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBackground,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Гродно',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  _data(),
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 22,
            backgroundImage:
                NetworkImage('https://thispersondoesnotexist.com/'),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: CartCards(notifyParent: () {setState(() {});},)),
          // Expanded(child: Container()),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cartItems.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 48),
                        backgroundColor: AppColors.accentColor),
                    child: const Text('Корзина пуста'),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 48),
                      backgroundColor: AppColors.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Оплатить ${state.cartItems.map((item) => item.price*item.count!).reduce((v1,v2) => v1+v2)}₽'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  String _data() {
    final now = DateTime.now();
    Intl.defaultLocale = 'ru_RU';
    initializeDateFormatting('ru_RU', null);
    String formatter = DateFormat('yMMMMd', 'ru_RU').format(now);
    return formatter;
  }
}
