import 'package:e_commerce/core/helpers/get_message_fun.dart';
import 'package:e_commerce/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SharedPreferences sharedPreferences;
  final LogInUsecase logIn;
  final SignUpUsecase signUp;
  AuthCubit(this.logIn, this.signUp, this.sharedPreferences)
      : super(AuthInitial());

  void login(String username, String password) async {
    emit(AuthLoadingState());
    final failureOrLogin = await logIn(userName: username, password: password);
    failureOrLogin.fold(
      (failure) => emit(AuthErrorState(getMessage(failure))),
      (_) => emit(RegesterDoneState()),
    );
  }

  void signup(String username, String email, String password) async {
    emit(AuthLoadingState());
    final failureOrSignup =
        await signUp(userName: username, email: email, password: password);
    failureOrSignup.fold(
        (failure) => emit(AuthErrorState(getMessage(failure))),
        (_) => emit(RegesterDoneState()));
  }

}
