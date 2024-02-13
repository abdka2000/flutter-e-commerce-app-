part of 'add_update_deleta_cubit.dart';

class AddUpdateDeleteState extends Equatable {
  const AddUpdateDeleteState();

  @override
  List<Object> get props => [];
}

class AddUpdateDeleteInitial extends AddUpdateDeleteState {}

class AddUpdateDeleteLoadingState extends AddUpdateDeleteState {}

class AddUpdateDeleteDoneState extends AddUpdateDeleteState {
  final String message;

  const AddUpdateDeleteDoneState(this.message);
  @override
  List<Object> get props => [message];
}

class AddUpdateDeleteErrorState extends AddUpdateDeleteState {
  final String message;

  const AddUpdateDeleteErrorState(this.message);
  @override
  List<Object> get props => [message];
}
