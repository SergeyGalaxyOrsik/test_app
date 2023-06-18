import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DishesEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String image_url;
  final List<String> tegs;
  int? count;
  int? cartPrice;

  DishesEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.image_url,
    required this.tegs,
    required this.count,
    required this.cartPrice
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        weight,
        description,
        image_url,
        tegs,
      ];
}
