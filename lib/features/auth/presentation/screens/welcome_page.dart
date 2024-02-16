import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/button_widget.dart';
import '../widgets/cosy_image.dart';

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

            const Text(
              "Add some coziness\n to your home",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 0.9,
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w100),
            ),
            const SizedBox(
              height: 20,
            ),
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
            ),
          ],
        ),
      ]),
    );
  }
}
