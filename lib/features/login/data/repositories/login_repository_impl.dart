import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/data/datasources/login_local_data_source.dart';
import 'package:test_ia/features/login/data/datasources/login_remote_data_source.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';
import 'package:test_ia/features/login/domain/repositories/login_repository.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl(this.remoteDataSource, {required this.localDataSource});

  @override
  Future<Either<AppException, AuthResponseEntity>> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      final userData = await remoteDataSource.authenticate(
        email: email,
        password: password,
      );

      return Right(userData);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, AuthResponseEntity>> readLocalAuthData(
    AuthResponseEntity data,
  ) async {
    try {
      final userData = await localDataSource.readAuthData();

      return Right(userData);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> writeLocalAuthData(
    AuthResponseEntity data,
  ) async {
    try {
      await localDataSource.writeAuthData(data);

      return Right(unit);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }
}
