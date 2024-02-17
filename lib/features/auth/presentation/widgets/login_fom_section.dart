import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginFormSection extends StatelessWidget {
   LoginFormSection({super.key});
  // ignore: no_leading_underscores_for_local_identifiers
final _loginKey = GlobalKey<FormState>();
final _userNameController = TextEditingController();
final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LoginForm(
            usernameController: _userNameController,
            passwordController: _passwordController,
            loginKey: _loginKey),
        ButtonWidget(
          text: "Sign in",
          fun: () {
            validateLogin(context);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account yet ? ",
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            ),
            InkWell(
              onTap: () {
                _clearField();
                GoRouter.of(context).pushReplacement(SIGNUP_PAGE);
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: AppColors.orange,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
    ],);

    
  }
  void validateLogin(BuildContext context) {
    final isValid = _loginKey.currentState!.validate();
    if (isValid) {
      BlocProvider.of<AuthCubit>(context)
          .login(_userNameController.text, _passwordController.text);
    }
  }
  void _clearField() {
    _passwordController.clear();
    _userNameController.clear();
  }
}