
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/presentation/bloc/categories/categories_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_list.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_appbar.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoadingState) {
                  return const Loading();
                } else if (state is CategoriesLoadedState) {
                  return CatsList(cats: state.categories);
                } else if (state is CategoriesErrorState) {
                  return Center(
                    child: Text(
                      state.erorMsg,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }
                return const Loading();
              },
            ),
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
            BlocBuilder<ProductsCubit, ProductsState>(
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
            )
          ],
        ),
      ),
    );
    ;
  }
}
