import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class DetailsPageBottom extends StatelessWidget {
  final Product product;
  const DetailsPageBottom({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Text(
              product.title,
              style: TextStyle(
                  color: AppColors.lightYellow, fontSize: 20, letterSpacing: 1),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "On sale",
                    style: TextStyle(
                        letterSpacing: 1, color: AppColors.lightYellow),
                  ),
                ),
                const Spacer(flex: 1),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.orange,
                      size: 14,
                    ),
                    Text(
                      "${product.rating!["rate"]}",
                      style: const TextStyle(
                          color: Colors.white, letterSpacing: 1),
                    )
                  ],
                ),
                const Spacer(flex: 1),
                Row(
                  children: [
                    const Icon(
                      Icons.comment_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      "${product.rating!["reviews"]} reviews",
                      style: const TextStyle(
                          color: Colors.white, letterSpacing: 1),
                    ),
                  ],
                )
              ],
            ),
            Text(
              product.description,
              style: const TextStyle(
                  color: Colors.white, fontSize: 12, letterSpacing: 1),
            ),
            Divider(
              thickness: 1,
              color: AppColors.lightGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ButtonWidget(text: "Add to Cart", fun: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
