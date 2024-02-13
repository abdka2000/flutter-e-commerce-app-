import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repository_impl.dart';


class LogInUsecase {
  final AuthRepositoryImpl authRepository;

  LogInUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call(
      {required String userName, required String password}) async {
    return await authRepository.logIn(userName: userName, password: password);
  }
}
