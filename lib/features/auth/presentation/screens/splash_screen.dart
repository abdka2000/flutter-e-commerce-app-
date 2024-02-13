import 'package:e_commerce/core/string/colors.dart';
import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/core/widgets/button_widget.dart';
import 'package:e_commerce/features/auth/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is NoRegesterState) {
            GoRouter.of(context).pushReplacement(WELCOME_PAGE);
          } else if (state is RegesterState) {
            GoRouter.of(context).pushReplacement(HOME_PAGE);
          }
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.darkGrey,
            child: Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 120,
              height: 120,
            ))));
  }

  navigate() {
    Future.delayed(const Duration(seconds: 5), () {
      BlocProvider.of<SplashCubit>(context).chechIfRegester();
    });
  }
}
