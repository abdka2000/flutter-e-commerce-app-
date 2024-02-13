import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/features/products/presentation/bloc/get_by_cat/get_by_cat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatsItem extends StatelessWidget {
  final String image;
  final String title;
  const CatsItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(CAT_PAGE , extra: title);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, _) => const Loading(),
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ]),
      ),
    );
  }
}
