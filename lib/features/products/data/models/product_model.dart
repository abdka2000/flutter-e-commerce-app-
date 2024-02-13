import 'package:e_commerce/features/products/domain/entities/product_entity.dart';

class ProductModel extends Product {
  ProductModel(
      { super.id,
      required super.title,
      required super.price,
      required super.category,
      required super.description,
      required super.image,
       super.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        category: json['category'],
        description: json['description'],
        image: json['image'],
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "title": title,
      "price": price,
      "category": category,
      "description": description,
      "image": image,
      "rateing": rating
    };
  }
}
