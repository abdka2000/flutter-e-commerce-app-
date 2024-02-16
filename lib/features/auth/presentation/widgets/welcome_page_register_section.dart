import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePageRegisterSection extends StatelessWidget {
  const WelcomePageRegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          text: "Sign in",
          fun: () {
            GoRouter.of(context).pushReplacement(LOGIN_PAGE);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account yet ?",
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).pushReplacement(SIGNUP_PAGE);
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: AppColors.orange,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        )
      ],
    );
  }
}
