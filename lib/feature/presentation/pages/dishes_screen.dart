import 'package:flutter/material.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/presentation/widgets/dishes/dishes_list_widget.dart';

class DishesPage extends StatelessWidget {
  final String appBarTitle;

  const DishesPage({required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$appBarTitle',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainBackground,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
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
      body: DishesListWidget(),
      
    );
  }
}
