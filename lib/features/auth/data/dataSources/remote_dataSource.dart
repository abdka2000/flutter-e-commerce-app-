import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/string/end_points.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<Unit> logIn(String userName, String password);

  Future<Unit> signUp(String userName, String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);
  @override
  Future<Unit> logIn(String userName, String password) async {
    final body = {
      "username": userName,
      "password": password,
    };

    final response = await client.post(Uri.parse(LOGIN_ENDPOINT), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ErrorNameOrPasswordException();
    }
  }

  @override
  Future<Unit> signUp(String userName, String email, String password) async {
    final body = {
      "username": userName,
      "email": email,
      "password": password,
    };
    final response = await client.post(Uri.parse(SIGNUP_ENDPOINT), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
