import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String image_url;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.image_url,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        image_url,
  ];
}
