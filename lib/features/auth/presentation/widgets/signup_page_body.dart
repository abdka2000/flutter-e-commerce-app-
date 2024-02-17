import 'package:e_commerce/features/auth/presentation/widgets/cosy_image.dart';
import 'package:e_commerce/features/auth/presentation/widgets/signup_form_section.dart';
import 'package:flutter/material.dart';

class SignupPageBody extends StatelessWidget {
  const SignupPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            const COSYImage(),
            const Text(
              "Sign up!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 0.9,
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sign up to show our special products",
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            ),
            const SizedBox(height: 60),
            SignupFormSection()
          ],
        )
      ],
    );
  }
}
