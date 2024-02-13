import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';

import 'package:e_commerce/features/products/presentation/widgets/search_field.dart';
import 'package:e_commerce/features/products/presentation/widgets/searched_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final controller = TextEditingController();

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchField(changeState: (val) {
            setState(() {});
          }),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Loading();
              } else if (state is ProductsLoadedState) {
                List<Product> allProducts = state.products;
                List<Product> searchedProducts = allProducts
                    .where((product) => product.title
                        .toLowerCase()
                        .contains(controller.text.toLowerCase()))
                    .toList();

                return ProductsSearchList(
                    products: allProducts, searchedProducts: searchedProducts);
              } else if (state is ProductsErrorState) {
                return const Center(
                    child: Text(
                  "No data..",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ));
              }
              return const Loading();
            },
          )
        ],
      ),
    );
  }
}
