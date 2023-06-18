import 'package:test_app/feature/domain/entities/category_entitry.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required id,
    required name,
    required image_url,
  }) : super(
          id: id,
          name: name,
          image_url: image_url,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image_url: json['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': image_url
    };
  }
}
