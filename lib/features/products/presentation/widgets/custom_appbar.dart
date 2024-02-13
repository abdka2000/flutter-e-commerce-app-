import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20 , horizontal :20),
      child: Row(
        children: [
          const Text(
            "Discover products",
            style: TextStyle(
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                // GoRouter.of(context).push(CART_PAGE);
              },
              icon: const Icon(
                Icons.card_travel_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(SEARCH_PAGE);
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
