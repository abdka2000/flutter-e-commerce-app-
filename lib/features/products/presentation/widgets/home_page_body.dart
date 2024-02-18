import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_appbar.dart';
import 'package:e_commerce/features/products/presentation/widgets/home_page_cat_section.dart';
import 'package:e_commerce/features/products/presentation/widgets/home_page_products_section.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const CategoriesSection(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Popular first:",
                style: TextStyle(
                    color: AppColors.lightYellow,
                    letterSpacing: 1,
                    fontSize: 16),
              ),
            ),
            const HomePageProductsSection()
          ],
        ),
      ),
    );
    
  }
}
