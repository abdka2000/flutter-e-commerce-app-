import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_product/add_product_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/bottom_sheet_form.dart';
import 'package:e_commerce/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddProductSheet extends StatelessWidget {
  const AddProductSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddProductCubit>(),
      child: BlocConsumer<AddProductCubit, AddProductState>(
        builder: (context, state) => const BottomSheetForm(),
        listener: (context, state) {
          if (state is AddProductError) {
            GoRouter.of(context).pop();
            Messagees.errorMessage(context, state.message);
          }
          if (state is AddProductDone) {
            GoRouter.of(context).pop();
            Messagees.succesMessage(context, state.message);
          }
        },
      ),
    );
  }
}
