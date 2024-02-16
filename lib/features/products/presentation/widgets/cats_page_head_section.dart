import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatsPageHeadSection extends StatelessWidget {
  final String image;
  final String title;
  const CatsPageHeadSection({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                )),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Loading(),
              errorWidget: (context, string, _) =>
                  const Center(child: Icon(Icons.error_outline)),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
