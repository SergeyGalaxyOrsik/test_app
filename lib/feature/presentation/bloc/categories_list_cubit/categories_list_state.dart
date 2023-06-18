import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesEmpty extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoading extends CategoriesState {
  final List<CategoryEntity> oldCategoriesList;

  const CategoriesLoading(this.oldCategoriesList);

  @override
  List<Object?> get props => [oldCategoriesList];

}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categoriesList;

  const CategoriesLoaded(this.categoriesList);

  @override
  List<Object?> get props => [categoriesList];

}

class CategoriesError extends CategoriesState {
  final String message;

  const CategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}