import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/cats_images.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class CollectionTitle extends StatelessWidget {
  final Product product;
  const CollectionTitle({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: CachedNetworkImage(
              imageUrl: catsImages[product.category].toString(),
              placeholder: (context, _) => const Loading(),
              fit: BoxFit.contain,
            width: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                "in collection:",
                style: TextStyle(color: AppColors.lightGrey, fontSize: 14),
              ),
              Text(
                product.category,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
