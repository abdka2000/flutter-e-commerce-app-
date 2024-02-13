import 'package:e_commerce/core/string/cats_images.dart';
import 'package:e_commerce/features/auth/presentation/widgets/cosy_image.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_item.dart';
import 'package:flutter/material.dart';

class CatsList extends StatelessWidget {
  final List<String> cats;
  const CatsList({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
  List<String> products = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg"
  ];
    return Container(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return CatsItem(
            image: products[index],
            title: cats[index],
          );
        },
      ),
    );
  }
}
