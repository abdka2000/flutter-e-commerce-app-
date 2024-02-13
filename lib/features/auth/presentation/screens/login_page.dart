import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup_page.dart';
import 'package:e_commerce/features/auth/presentation/widgets/cosy_image.dart';
import 'package:e_commerce/features/auth/presentation/widgets/high_text.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_form.dart';
import 'package:e_commerce/features/auth/presentation/widgets/small_text.dart';
import 'package:e_commerce/features/auth/presentation/widgets/spacing.dart';
import 'package:e_commerce/features/products/presentation/screens/home_page.dart';
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
        const Spacing(),
        const COSYImage(),
        const HighText(text: "Log in!"),
        const Spacing(),
        const SmallText(text: "Sign in to show our special products"),
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
            const SmallText(
              text: "Don't have an account yet ? ",
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
        const Spacing(),
        const Spacing(),
        const Spacing()
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
