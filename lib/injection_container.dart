import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/auth/data/dataSources/auth_local_dataSource.dart';
import 'package:e_commerce/features/auth/data/dataSources/auth_remote_dataSource.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repository_impl.dart';
import 'package:e_commerce/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:e_commerce/features/products/data/datasources/local_data_dource.dart';
import 'package:e_commerce/features/products/data/datasources/remote_data_dource.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';
import 'package:e_commerce/features/products/domain/usecases/add_product_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_cat_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_products_by_category_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/update_product_usecase.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_product/add_product_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/add_update_delete/add_update_deleta_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/categories/categories_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/get_by_cat/get_by_cat_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/products/products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Features - auth

  //Cubit
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl()));
  sl.registerFactory(() => SplashCubit(sl()));

  //Usecases
  sl.registerLazySingleton(() => LogInUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => SignUpUsecase(authRepository: sl()));

  //Repository
  sl.registerLazySingleton(() => AuthRepositoryImpl(sl(), sl(), sl()));

  //Data Sources
  sl.registerLazySingleton(() => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton(() => AuthLocalDataSourceImpl(sl()));

  //External
  sl.registerLazySingleton(() => http.Client());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //Core
  sl.registerLazySingleton(() => NetworkInfo());

  //Features - product

  //Cubit
  sl.registerFactory(() => CategoriesCubit(sl()));
  sl.registerFactory(() => ProductsCubit(sl()));
  sl.registerFactory(() => AddUpdateDeletaCubit(sl(), sl(), sl()));
  sl.registerFactory(() => GetByCatCubit(sl()));
   sl.registerFactory(() => AddProductCubit(sl()));

  //Usecases
  sl.registerLazySingleton(() => GetAllCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => AddProductUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(sl()));
  sl.registerLazySingleton(
      () => GetProductsByCategoryUsecase(productsRepository: sl()));

  //Repository
  sl.registerLazySingleton(() => ProductsRepositoryImpl(sl(), sl(), sl()));

  //Datasources
  sl.registerLazySingleton(() => ProductsRemoteDataSourceImpl());
  sl.registerLazySingleton(() => ProductsLocalDatasourceImpl(sl()));
}
