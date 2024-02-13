import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;
  final bool isLimit;
  const ProductsList({super.key, required this.products, required this.isLimit});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: GridView.builder(
          itemCount: isLimit? 5 : products.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: ((context, index) {
            return ProductItem(product: products[index]);
          })),
    );
  }
}
