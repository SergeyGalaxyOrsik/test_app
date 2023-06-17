import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_state.dart';
import 'package:test_app/feature/presentation/widgets/category/category_card_widget.dart';
import 'package:test_app/feature/presentation/widgets/loading_indicator_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesState>(
      builder: (context, state) {
        List<CategoryEntity> categories = [];
        if (state is CategoriesLoading) {
          return LoadingIndicator();
        } else if (state is CategoriesLoaded) {
          categories = state.categoriesList;
        }
        return ListView.builder(
          
          itemBuilder: (context, index) {
            // print(categories[index]);
            return CategoryCard(category: categories[index]);
          },
          itemCount: categories.length,
        );
      },
    );
  }

}
