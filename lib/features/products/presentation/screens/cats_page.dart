import 'package:e_commerce/features/products/presentation/widgets/cats_page_body_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/src/state.dart';

class CatsPage extends StatelessWidget {
  final String title;
  const CatsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CatsPageBodySection(catTitle: title));
  }
}
