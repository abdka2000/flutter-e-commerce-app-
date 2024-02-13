import 'package:e_commerce/features/products/presentation/widgets/add_button.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddButton(),
    );
  }
}