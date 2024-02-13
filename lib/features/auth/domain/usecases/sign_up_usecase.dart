import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repository_impl.dart';


class SignUpUsecase {
  final AuthRepositoryImpl authRepository;

  SignUpUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call(
      {required String userName,
      required String email,
      required String password}) async {
    return await authRepository.signUp(
        userName: userName, email: email, password: password);
  }
}
