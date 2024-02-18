import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/rating_reviews.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title,
              style: TextStyle(color: AppColors.lightYellow, fontSize: 25)),
          const SizedBox(height: 5),
          const RatingReviews(),
          const SizedBox(
            height: 10,
          ),
          Text(product.description,
              style: const TextStyle(color: Colors.white, letterSpacing: 1)),
          const SizedBox(
            height: 20,
          ),
          Divider(thickness: 1, height: 5, color: AppColors.lightGrey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * .61,
                  child: ButtonWidget(
                      text: "Add to cart",
                      fun: () {
                        GoRouter.of(context).pop();
                        Messagees.errorMessage(
                            context, "Can't add try again later");
                      }))
            ],
          )
        ],
      ),
    );
  }
}
