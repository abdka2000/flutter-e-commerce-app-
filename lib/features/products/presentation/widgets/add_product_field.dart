
import 'package:flutter/material.dart';

import '../../../../core/string/colors.dart';

class AddProductField extends StatelessWidget {
  final String hint;
  final TextInputType? type;
  final TextEditingController controller;
  const AddProductField({
    Key? key,
    required this.hint,
    this.type,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: type ,
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
