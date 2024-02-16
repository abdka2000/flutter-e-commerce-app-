import 'package:e_commerce/core/string/navigation.dart';
import 'package:e_commerce/features/auth/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_page.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup_page.dart';
import 'package:e_commerce/features/auth/presentation/screens/welcome_page.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/bloc/categories/categories_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/get_by_cat/get_by_cat_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/screens/cats_page.dart';
import 'package:e_commerce/features/products/presentation/screens/home_page.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details_page.dart';
import 'package:e_commerce/features/products/presentation/screens/search_page.dart';
import 'package:e_commerce/features/products/presentation/screens/test.dart';
import 'package:e_commerce/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/features/auth/presentation/screens/splash_screen.dart';

import '../../features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => BlocProvider(
        create: (context) => sl<SplashCubit>(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: HOME_PAGE,
      builder: (context, state) => MultiBlocProvider(providers: [
        BlocProvider(create: (_) => sl<ProductsCubit>()..getProducts()),
        BlocProvider(create: (_) => sl<CategoriesCubit>()..getCategories()),
      ], child: const HomePage()),
    ),
    GoRoute(
      path: LOGIN_PAGE,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: SEARCH_PAGE,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<ProductsCubit>(),
        child: const SearchPage(),
      ),
    ),
    GoRoute(
      path: SIGNUP_PAGE,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const SignupPage(),
      ),
    ),
    GoRoute(
      path: WELCOME_PAGE,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: DETAILS_PAGE,
      builder: (context, state) =>
          ProductDetailsPage(product: state.extra as Product),
    ),
    GoRoute(
      path: CAT_PAGE,
      builder: (context, state) =>  BlocProvider(
        create: (_) => sl<GetByCatCubit>()..getProductsByCat(state.extra as String),
        child:  CatsPage(title: state.extra as String,),
      ),
    ),
  ]);
}
