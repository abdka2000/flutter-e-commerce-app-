import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';


abstract class AuthRepository {
  Future<Either<Failure, Unit>> logIn({required String userName, required String password});

  Future<Either<Failure, Unit>> signUp(
      {required String userName,required String email,required String password});
}
