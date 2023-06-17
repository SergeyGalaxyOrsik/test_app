import 'package:test_app/feature/domain/entities/dishes_entity.dart';

class DishesModel extends DishesEntity {
  DishesModel({
    required id,
    required name,
    required price,
    required weight,
    required description,
    required image_url,
    required tegs,
  }) : super(
          id: id,
          name: name,
          price: price,
          weight: weight,
          description: description,
          image_url: image_url,
          tegs: tegs,
        );

  factory DishesModel.fromJson(Map<String, dynamic> json) {
    return DishesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      weight: json['weight']as int,
      description: json['description'] as String,
      image_url: json['image_url'] as String,
      tegs: (json['tegs'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'description': description,
      'image_url': image_url,
      'tegs': tegs
    };
  }
}
