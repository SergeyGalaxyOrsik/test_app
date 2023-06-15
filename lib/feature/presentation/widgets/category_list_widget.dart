import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_state.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesState>(
      builder: (context, state) {
        List<CategoryEntity> categories = [];
        if (state is CategoriesLoading) {
          return _loadingIndicator();
        } else if (state is CategoriesLoaded) {
          categories = state.categoriesList;
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return Text('${categories[index]}');
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
          itemCount: categories.length,
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
