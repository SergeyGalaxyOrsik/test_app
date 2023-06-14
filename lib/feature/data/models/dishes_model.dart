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
      id: json['id'],
      name: json['name'],
      price: json['price'],
      weight: json['weight'],
      description: json['description'],
      image_url: json['image_url'],
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
