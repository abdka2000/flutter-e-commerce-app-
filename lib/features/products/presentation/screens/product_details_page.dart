import 'package:e_commerce/features/products/presentation/widgets/details_page_app_bar.dart';
import 'package:e_commerce/features/products/presentation/widgets/details_page_bottom.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_details_page_body.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
           ProductDetailsPageBody(product: product,),
    );
  }
}
