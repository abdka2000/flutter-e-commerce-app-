import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class Catspageitem extends StatelessWidget {
  final Product product;
  const Catspageitem({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, string, _) =>
                              const Center(child: Icon(Icons.error_outline)),
                        )),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: AppColors.darkGrey,
                      child: Icon(
                        Icons.remove,
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
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
                "\$ ${product.price}",
                style: TextStyle(color: AppColors.lightYellow, fontSize: 16),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
