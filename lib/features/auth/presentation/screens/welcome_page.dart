import 'package:e_commerce/features/auth/presentation/widgets/welcome_page_body.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WelcomePageBody(),
      ),
    );
  }
}
