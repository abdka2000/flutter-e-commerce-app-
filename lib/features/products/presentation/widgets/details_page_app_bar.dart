import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/collection_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPageAppBar extends StatelessWidget {
  final Product product;
  const DetailsPageAppBar({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkGrey,
            ),
            child: IconButton(
                onPressed: () {
                GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                )),
          ),
          const Spacer(),
          CollectionTitle(
            product: product,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkGrey,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_rounded,
                  color: AppColors.orange,
                  size: 20,
                )),
          ),
        ],
      ),
    );
  }
}
