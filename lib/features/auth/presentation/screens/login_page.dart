import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/cosy_image.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// ignore: no_leading_underscores_for_local_identifiers
GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
TextEditingController _userNameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          Messagees.errorMessage(context, state.message);
        } else if (state is RegesterDoneState) {
          GoRouter.of(context).pushReplacement(HOME_PAGE);
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Loading();
        }
        return _buildBody(context);
      },
    ));
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const COSYImage(),
        const Text(
          "Log in!",
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
        const Text(
          "Sign in to show our special products",
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
        const Spacer(
          flex: 1,
        ),
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
        const Spacer(
          flex: 2,
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
        const SizedBox(
          height: 60,
        ),
      ],
    );
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
