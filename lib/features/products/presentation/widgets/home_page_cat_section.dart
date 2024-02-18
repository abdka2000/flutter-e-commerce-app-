import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/presentation/bloc/categories/categories_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
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
    );
  }
}
