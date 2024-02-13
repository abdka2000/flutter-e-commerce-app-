import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/string/failures.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/domain/usecases/add_product_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/update_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_update_deleta_state.dart';

class AddUpdateDeletaCubit extends Cubit<AddUpdateDeleteState> {
  final AddProductUsecase add;
  final UpdateProductUsecase update;
  final DeleteProductUsecase delete;
  AddUpdateDeletaCubit(this.add, this.update, this.delete)
      : super(AddUpdateDeleteInitial());

  void addProduct(Product product) async {
    emit(AddUpdateDeleteLoadingState());
    final addOrFailure = await add(product);
    emit(_getState(addOrFailure));
  }

  void updateProduct(Product product) async {
     emit(AddUpdateDeleteLoadingState());
    final updateOrFailure = await update(product);
    emit(_getState(updateOrFailure));
  }

  void deleteProduct(int productId) async {
     emit(AddUpdateDeleteLoadingState());
    final deleteOrFailure = await delete(productId);
    emit(_getState(deleteOrFailure));
  }

  AddUpdateDeleteState _getState(Either<Failure, Unit> either) {
    return either.fold(
        (failure) => AddUpdateDeleteErrorState(_getMessage(failure)),
        (_) => const AddUpdateDeleteErrorState("Done!"));
  }

  String _getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MSG;
      case ServerFailure:
        return SERVER_FAILURE_MSG;
      default:
        return UNEXCEPTION_FAILURE_MSG;
    }
  }
}
