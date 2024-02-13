import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/auth/data/dataSources/local_dataSource.dart';
import 'package:e_commerce/features/auth/data/dataSources/remote_dataSource.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSource;
  final NetworkInfo networkInfo;
  final AuthLocalDataSourceImpl localDataSource;
  // final LocalDataSource localDataSource;

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.networkInfo,
    this.localDataSource,
  );
  @override
  Future<Either<Failure, Unit>> logIn(
      {required String userName, required String password}) async {
    if (await networkInfo.checkConnect()) {
      try {
        await remoteDataSource.logIn(userName, password);
        await localDataSource.clear();
        await localDataSource.cacheLogin(userName, password);
        return const Right(unit);
      } on ErrorNameOrPasswordException {
        return Left(ErrorNameOrPasswordFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(
      {required String userName,
      required String email,
      required String password}) async {
    if (await networkInfo.checkConnect()) {
      try {
        await remoteDataSource.signUp(userName, email, password);
        await localDataSource.clear();
        await localDataSource.cacheLogin(userName, password);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
