import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/loading.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
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
          return const LoginPageBody();
        },
      ),
    ));
  }
}
