part of 'add_product_cubit.dart';

class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductDone extends AddProductState {
  final String message;

  const AddProductDone(this.message);
  @override
  List<Object> get props => [message];
}

class AddProductError extends AddProductState {
  final String message;

  const AddProductError(this.message);
  @override
  List<Object> get props => [message];
}
