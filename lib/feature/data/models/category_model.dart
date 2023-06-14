import 'package:flutter/material.dart';
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
      id: json['id'],
      name: json['name'],
      image_url: json['image_url'],
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
