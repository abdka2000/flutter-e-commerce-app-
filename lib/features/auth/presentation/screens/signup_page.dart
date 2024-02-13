import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/signup_form.dart';
import 'package:e_commerce/features/products/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/loading.dart';
import '../widgets/cosy_image.dart';
import '../widgets/high_text.dart';
import '../widgets/small_text.dart';
import '../widgets/spacing.dart';
import 'login_page.dart';

TextEditingController _usernameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
        const HighText(text: "Sign up!"),
        const Spacing(),
        const SmallText(text: "Sign up to show our special products"),
        const Spacer(
          flex: 1,
        ),
        SignupForm(
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
        const Spacer(
          flex: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SmallText(
              text: "Already have an account? ",
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
        const Spacing(),
        const Spacing(),
        const Spacing(),
      ],
    );
  }

  void validateLogin(BuildContext context) {
    final isValid = _signupKey.currentState!.validate();
    if (isValid) {
      BlocProvider.of<AuthCubit>(context).signup(_usernameController.text,
          _emailController.text, _passwordController.text);
    }
  }
}

void _clearField() {
  _emailController.clear();
  _passwordController.clear();
  _usernameController.clear();
}
