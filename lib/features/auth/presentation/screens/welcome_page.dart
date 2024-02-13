import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_page.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/button_widget.dart';
import '../widgets/cosy_image.dart';
import '../widgets/high_text.dart';
import '../widgets/small_text.dart';
import '../widgets/spacing.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: Image.asset(
                "assets/images/main image.png",
                fit: BoxFit.cover,
              ),
            ),
            const COSYImage(),
            const HighText(
              text: "Add some coziness\n to your home",
            ),
            const Spacing(),
            ButtonWidget(
              text: "Sign in",
              fun: () {
                GoRouter.of(context).pushReplacement(LOGIN_PAGE);
              },
            ),
            const Spacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SmallText(
                  text: "Don't have an account yet ? ",
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
            ),
          ],
        ),
      ]),
    );
  }
}
