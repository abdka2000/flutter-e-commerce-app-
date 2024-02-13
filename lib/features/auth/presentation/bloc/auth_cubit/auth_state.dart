part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class RegesterDoneState extends AuthState {}
