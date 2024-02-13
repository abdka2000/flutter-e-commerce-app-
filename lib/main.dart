import 'package:e_commerce/core/helpers/app_router.dart';
import 'package:e_commerce/core/helpers/app_theme.dart';
import 'package:e_commerce/core/helpers/cubit_observer.dart';
import 'package:e_commerce/core/helpers/hive_box.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await di.init();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox("products");
  await Hive.openBox("cats");
  await Hive.openBox("electronics");
  await Hive.openBox("jewelery");
  await Hive.openBox("men's clothing");
  await Hive.openBox("women's clothing");

  Bloc.observer = CubitObserver();
  print("**********${HiveBox.productsBox.values}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
