import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/features/products/presentation/widgets/add_product_sheet.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            context: context,
            builder: (context) => const AddProductSheet());
      },
      backgroundColor: AppColors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
