import 'package:e_commerce/core/helpers/get_message_fun.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/domain/usecases/add_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.add) : super(AddProductInitial());
  final AddProductUsecase add;

  addProduct(Product product) async {
    emit(AddProductLoading());
    final addOrFailure = await add(product);
    addOrFailure.fold(
      (failure) => emit(AddProductError(getMessage(failure))),
        (_) => emit(const AddProductDone("Product added succesfully!")));
  }
}
