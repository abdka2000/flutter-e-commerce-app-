import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _signupKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupForm(
            autovalidateMode: autovalidateMode,
            usernameController: _usernameController,
            emailController: _emailController,
            passwordController: _passwordController,
            signupKey: _signupKey),
        ButtonWidget(
          text: "Sign up",
          fun: () {
            validateLogin(context);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account ? ",
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            ),
            InkWell(
              onTap: () {
                _clearField();
                GoRouter.of(context).pushReplacement(LOGIN_PAGE);
              },
              child: Text(
                "Sign in",
                style: TextStyle(
                    color: AppColors.orange,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  void validateLogin(BuildContext context) {
    final isValid = _signupKey.currentState!.validate();
    if (isValid) {
      BlocProvider.of<AuthCubit>(context).signup(_usernameController.text,
          _emailController.text, _passwordController.text);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void _clearField() {
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
  }
}
