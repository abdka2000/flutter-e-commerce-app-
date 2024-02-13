part of 'products_cubit.dart';

class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Product> products;

  const ProductsLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String message;

  const ProductsErrorState(this.message);
  @override
  List<Object> get props => [message];
}
