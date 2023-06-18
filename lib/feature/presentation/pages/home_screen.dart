import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/presentation/widgets/category/category_list_widget.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          SizedBox(width: 16,)
          
        ],
      ),
      body: const CategoryList(),
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
