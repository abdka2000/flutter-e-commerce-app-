import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_details_section.dart';
import 'package:e_commerce/features/products/presentation/widgets/details_page_app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailsPageBody extends StatelessWidget {
  final Product product;
  const ProductDetailsPageBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        DetailsPageAppBar(
          product: product,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (context, _) => const Loading(),
                errorWidget: (context, string, _) =>
                    const Center(child: Icon(Icons.error_outline))),
          ),
        ),
        ProductDetailsSection(product: product)
      ]),
    );
  }
}
