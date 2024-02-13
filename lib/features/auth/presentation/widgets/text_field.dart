import 'package:e_commerce/core/string/colors.dart';
import 'package:flutter/material.dart';


class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  final String hint;
  const TextFieldWidget(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty? "$hint can't be empty" : null,
      controller: controller,
      cursorColor: AppColors.darkGrey,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.darkGrey, letterSpacing: 1),
      ),
    );
  }
}