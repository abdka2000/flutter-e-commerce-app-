import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final Map? rating;
  const Product(
      { this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image,
      required this.rating});
}
