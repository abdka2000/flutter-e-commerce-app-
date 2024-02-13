import 'package:e_commerce/core/helpers/get_message_fun.dart';
import 'package:e_commerce/features/products/domain/usecases/get_cat_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetAllCategoriesUsecase cats;
  CategoriesCubit(this.cats) : super(CategoriesInitial());

  getCategories() async {
    emit(CategoriesLoadingState());
    final catsOrFailure = await cats();
    catsOrFailure.fold(
        (failure) => emit(CategoriesErrorState(getMessage(failure))),
        (categories) => emit(CategoriesLoadedState(categories)));
  }
}
