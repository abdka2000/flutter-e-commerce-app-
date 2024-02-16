import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_product/add_product_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_update_delete/add_update_deleta_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/add_product_field.dart';
import 'package:e_commerce/features/products/presentation/widgets/bottom_sheet_body.dart';
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
        builder: (context, state) => const BottomSheetBody(),
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
