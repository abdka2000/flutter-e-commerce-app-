import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/features/auth/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> signupKey;
  final AutovalidateMode autovalidateMode;

  const SignupForm(
      {super.key,
      required this.usernameController,
      required this.emailController,
      required this.passwordController,
      required this.signupKey,
      required this.autovalidateMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Form(
          autovalidateMode: autovalidateMode,
          key: signupKey,
          child: Column(
            children: [
              TextFieldWidget(
                hint: "User name",
                controller: usernameController,
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: AppColors.darkGrey,
              ),
              TextFieldWidget(hint: "email", controller: emailController),
              Divider(
                height: 10,
                thickness: 1,
                color: AppColors.darkGrey,
              ),
              TextFieldWidget(
                hint: "password",
                controller: passwordController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
