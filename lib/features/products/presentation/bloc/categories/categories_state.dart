part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final List<String> categories;

  const CategoriesLoadedState(this.categories);
  @override
  List<Object> get props => [categories];
}

class CategoriesErrorState extends CategoriesState {
  final String erorMsg;

  const CategoriesErrorState(this.erorMsg);
  @override
  List<Object> get props => [erorMsg];
}
