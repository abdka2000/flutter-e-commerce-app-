import 'package:e_commerce/features/products/presentation/widgets/add_button.dart';
import 'package:e_commerce/features/products/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        floatingActionButton: AddButton(),
        body: SafeArea(child: HomePageBody()));
  }
}
