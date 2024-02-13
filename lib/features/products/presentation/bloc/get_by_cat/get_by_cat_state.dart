part of 'get_by_cat_cubit.dart';

class GetByCatState extends Equatable {
  const GetByCatState();

  @override
  List<Object> get props => [];
}

class GetByCatInitial extends GetByCatState {}

class GetByCatLoading extends GetByCatState {}

class GetByCatLoaded extends GetByCatState {
  final List<Product> products;

  const GetByCatLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class GetByCatError extends GetByCatState {
  final String message;

  const GetByCatError( {required this.message});
  @override
  List<Object> get props => [message];
}
