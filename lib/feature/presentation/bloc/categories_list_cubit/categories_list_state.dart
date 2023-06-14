import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/category_entitry.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesEmpty extends CategoriesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoriesLoading extends CategoriesState {
  final List<CategoryEntity> oldCategoriesList;

  CategoriesLoading(this.oldCategoriesList);

  @override
  // TODO: implement props
  List<Object?> get props => [oldCategoriesList];

}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categoriesList;

  CategoriesLoaded(this.categoriesList);

  @override
  // TODO: implement props
  List<Object?> get props => [categoriesList];

}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}