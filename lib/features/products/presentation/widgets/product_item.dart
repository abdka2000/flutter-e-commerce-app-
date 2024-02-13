import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(DETAILS_PAGE, extra: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context , string , _)=>const Center(child: Icon(Icons.error_outline)),
                        )),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: AppColors.darkGrey,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(color: AppColors.lightYellow, fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  product.category,
                  style: const TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
