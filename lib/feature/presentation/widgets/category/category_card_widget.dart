import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/presentation/pages/dishes_screen.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;
  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DishesPage(
                appBarTitle: '${category.name}',
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              // image: DecorationImage(image: NetworkImage(category.image_url))
              // color: AppColors.cellBackground
              ),
          child: Stack(
            children: [
              Image.network(category.image_url),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12.0),
                child: Container(
                  width: 200,
                  child: Text(
                    '${category.name}',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 20,
                    ),
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
