import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/cats_images.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/bloc/get_by_cat/get_by_cat_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_page_head_section.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_page_item.dart';
import 'package:e_commerce/features/products/presentation/widgets/cats_page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsPageBodySection extends StatelessWidget {
  final String catTitle;

  const CatsPageBodySection({super.key, required this.catTitle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetByCatCubit, GetByCatState>(
      builder: (context, state) {
        if (state is GetByCatLoading) {
          return const Loading();
        } else if (state is GetByCatLoaded) {
          return _buildBody(state.products);
        } else if (state is GetByCatError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        }
        return const Loading();
      },
    );
  }

  Widget _buildBody(List<Product> products) {
    final String catImage = catsImages[catTitle].toString();
    return ListView(
      children: [
        CatsPageHeadSection(image: catImage, title: catTitle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Pupular First:",
            style: TextStyle(
                color: AppColors.lightYellow, letterSpacing: 1, fontSize: 18),
          ),
        ),
        CatsPageList(
          catProducts: products,
        )
      ],
    );
  }
}
