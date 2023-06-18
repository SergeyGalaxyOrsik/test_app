import 'package:flutter/material.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/presentation/pages/dishes_screen.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;
  const CategoryCard({super.key, required this.category});

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
                appBarTitle: category.name,
              ),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.network(category.image_url),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12.0),
                child: SizedBox(
                  width: 200,
                  child: Text(
                    category.name,
                    style: const TextStyle(
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
