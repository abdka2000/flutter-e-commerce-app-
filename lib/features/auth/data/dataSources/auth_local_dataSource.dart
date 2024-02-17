import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<Unit> cacheLogin(String username, String password);

  void clear();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cacheLogin(String userName, String password) {
    sharedPreferences.setString("username", userName);
    sharedPreferences.setString("password", password);
    return Future.value(unit);
  }

  @override
  Future clear() async {
    await sharedPreferences.clear();
  }
}
