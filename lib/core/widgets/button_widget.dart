import 'package:e_commerce/core/string/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final  Function() fun;
  final String text;
  const ButtonWidget({super.key, required this.text, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        onPressed: fun,
        minWidth: double.infinity,
        height: 70,
        color: AppColors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          text,
          style: const TextStyle(
              letterSpacing: 1, color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
