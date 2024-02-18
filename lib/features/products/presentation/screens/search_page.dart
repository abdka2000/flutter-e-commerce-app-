import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/search_field.dart';
import 'package:e_commerce/features/products/presentation/widgets/search_page_products_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
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
          SearchField(
              controller: controller,
              changeState: (val) {
                setState(() {});
              }),
          SearchPageProductsSection(controller: controller)
        ],
      ),
    );
  }
}
