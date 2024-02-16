import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/snackbar_message.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/signup_form.dart';
import 'package:e_commerce/features/auth/presentation/widgets/signup_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/loading.dart';
import '../widgets/cosy_image.dart';



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
        return const SignupPageBody();
      },
    ));
  }

 
}
