import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_list.dart';
import 'package:e_commerce/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends SearchDelegate {
  @override
  InputDecorationTheme? get searchFieldDecorationTheme =>
      InputDecorationTheme(fillColor: AppColors.darkGrey);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.clear_rounded,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>(),
      child: buildSerchBody(context),
    );
  }

  Widget buildSerchBody(BuildContext context) {
    List<Product> products =
        BlocProvider.of<ProductsCubit>(context).getProducts();
    List<Product> searcedProducts = products
        .where((product) => product.title.toLowerCase().contains(query))
        .toList();
    return ProductsList(
        products: searcedProducts.isNotEmpty ? searcedProducts : products,
        isLimit: false);
  }
}
