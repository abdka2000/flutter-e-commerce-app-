
import 'package:flutter/material.dart';
import '../../../../core/string/colors.dart';

class AddProductField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const AddProductField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.orange,
        style: const TextStyle(color: Colors.white),
        validator: (val) {
          if (val!.isEmpty) {
            return "this field must be full!";
          }
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 163, 163, 163),
              fontWeight: FontWeight.w300),
          border: const OutlineInputBorder(),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange)
          ),
        ),
      ),
    );
  }
}
