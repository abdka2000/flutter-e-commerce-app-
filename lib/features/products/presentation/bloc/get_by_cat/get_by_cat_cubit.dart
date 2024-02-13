import 'package:e_commerce/features/products/domain/usecases/get_products_by_category_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/helpers/get_message_fun.dart';

part 'get_by_cat_state.dart';

class GetByCatCubit extends Cubit<GetByCatState> {
  final GetProductsByCategoryUsecase getProductsByCategory;
  GetByCatCubit(this.getProductsByCategory) : super(GetByCatInitial());

  getProductsByCat(String cat) async {
    final productsOrFailure = await getProductsByCategory(cat);
    productsOrFailure
        .fold((failure) => emit(GetByCatError(message: getMessage(failure))),
            (products) {
      emit(GetByCatLoaded(products: products));
    });
  }
}
