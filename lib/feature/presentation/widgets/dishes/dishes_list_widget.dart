import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/domain/entities/dishes_entity.dart';
import 'package:test_app/feature/presentation/bloc/dishes_list_cubit/dishes_list_cubit.dart';
import 'package:test_app/feature/presentation/bloc/dishes_list_cubit/dishes_list_state.dart';
import 'package:test_app/feature/presentation/widgets/dishes/dishe_card_widget.dart';
import 'package:test_app/feature/presentation/widgets/loading_indicator_widget.dart';


class DishesListWidget extends StatefulWidget {
  const DishesListWidget({super.key});

  @override
  State<DishesListWidget> createState() => _DishesListWidgetState();
}

class _DishesListWidgetState extends State<DishesListWidget> {
  final List<String> tegs = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой',
  ];
  List<String> selectedTegs = ['Все меню'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishesListCubit, DishesState>(
      builder: (context, state) {
        List<DishesEntity> dishes = [];

        if (state is DishesLoading) {
          return const LoadingIndicator();
        } else if (state is DishesLoaded) {
          dishes = state.dishesList;
        }
        final filterDishes = dishes.where((dishe) {
          for (int i = 0; i < dishe.tegs.length; i++) {
            if (selectedTegs.contains(dishe.tegs[i])) {
              return selectedTegs.contains(dishe.tegs[i]);
            }
          }
          return selectedTegs.isEmpty;
        }).toList();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tegs
                  .map(
                    (teg) => FilterChip(
                      selectedColor: AppColors.accentColor,
                      disabledColor: AppColors.cellBackground,
                      backgroundColor: AppColors.cellBackground,
                      labelStyle: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                      ),
                      showCheckmark: false,
                      selected: selectedTegs.contains(teg),
                      label: Text(teg),
                      onSelected: (selected) {
                        setState(
                          () {
                            if (selected) {
                              selectedTegs.add(teg);
                            } else {
                              selectedTegs.remove(teg);
                            }
                          },
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    // print(categories[index]);
                    final dishe = filterDishes[index];
                    return DishesCard(
                      dishe: dishe,
                    );
                  },
                  itemCount: filterDishes.length,
                ),
              ),
            
          ],
        );
      },
    );
  }
}
