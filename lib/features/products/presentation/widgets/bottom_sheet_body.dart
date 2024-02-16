import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_product/add_product_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_update_delete/add_update_deleta_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/add_product_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final discreptionController = TextEditingController();
    final imageController = TextEditingController();
    final priceController = TextEditingController();

    _checkAddProduct() {
      final check = formKey.currentState!.validate();
      if (check) {
        final product = Product(
            title: titleController.text,
            price: double.parse(priceController.text),
            category: "category",
            description: discreptionController.text,
            image: imageController.text,
            rating: {});
        BlocProvider.of<AddProductCubit>(context).addProduct(product);
      }
    }

    return Container(
      color: AppColors.darkGrey,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Add New Product",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  )),
              AddProductField(
                hint: "product title",
                controller: titleController,
              ),
              AddProductField(
                hint: "product discreption",
                controller: discreptionController,
              ),
              AddProductField(
                hint: "product image url",
                controller: imageController,
              ),
              AddProductField(
                hint: "product price",
                controller: priceController,
                type: TextInputType.number,
              ),
              ButtonWidget(text: "Add New Product", fun: _checkAddProduct),
            ],
          ),
        ),
      ),
    );
  }
}
