
import 'package:flutter/material.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/presentation/widgets/dishes/dishe_full_card_widget.dart';

class DishesCard extends StatelessWidget {
  final DishesEntity dishe;
  const DishesCard({super.key, required this.dishe});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(context: context, builder: (context) => DishesFullCard(dishe: dishe));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 109,
              width: 109,
              decoration: BoxDecoration(
                color: AppColors.cellBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(dishe.image_url),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              dishe.name,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  
}
