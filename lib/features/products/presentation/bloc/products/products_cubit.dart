import 'package:e_commerce/core/helpers/get_message_fun.dart';
import 'package:e_commerce/core/helpers/hive_box.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/domain/usecases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProductsUsecase products;
  ProductsCubit(this.products) : super(ProductsInitial());
  

  getProducts() async {
    emit(ProductsLoadingState());
    final productsOrFailure = await products();
    productsOrFailure.fold(
        (failure) => emit(ProductsErrorState(getMessage(failure))), (products) {
      emit(ProductsLoadedState(products));
      
      
    });
  }
}
