import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print("on Create -- ${bloc.runtimeType} ");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("on Change -- ${bloc.runtimeType} , $change");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print("on Close -- ${bloc.runtimeType} ");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print("on Error -- ${bloc.runtimeType} , $error");
  }
}
