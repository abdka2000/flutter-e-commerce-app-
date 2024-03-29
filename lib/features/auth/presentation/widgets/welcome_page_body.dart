import 'package:e_commerce/features/auth/presentation/widgets/cosy_image.dart';
import 'package:e_commerce/features/auth/presentation/widgets/welcome_page_register_section.dart';
import 'package:flutter/material.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
          const SizedBox(height: 20),
          const WelcomePageRegisterSection(),
        ],
      ),
    ]);
  }
}
