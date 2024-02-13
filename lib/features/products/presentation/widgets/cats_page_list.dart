import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_page_item.dart';
import 'package:flutter/material.dart';

class CatsPageList extends StatelessWidget {
  final List<Product> catProducts;
  const CatsPageList({
    super.key,
    required this.catProducts,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: catProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.1 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, i) => Catspageitem(
              product: catProducts[i],
            ));
  }
}
