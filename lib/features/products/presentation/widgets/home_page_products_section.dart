
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageProductsSection extends StatelessWidget {
  const HomePageProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Loading();
        } else if (state is ProductsLoadedState) {
          return ProductsList(products: state.products, isLimit: true);
        } else if (state is ProductsErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }
        return const Loading();
      },
    );
  }
}
