import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SharedPreferences sharedPreferences;
  SplashCubit(this.sharedPreferences) : super(SplashInitial());

  void chechIfRegester() {
    String? username = sharedPreferences.getString("username");
    String? password = sharedPreferences.getString("password");
    if (username != null && password != null) {
      emit(RegesterState());
    } else {
      emit(NoRegesterState());
    }
  }
}
