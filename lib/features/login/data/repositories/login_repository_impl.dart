import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/data/datasources/login_remote_data_source.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';
import 'package:test_ia/features/login/domain/repositories/login_repository.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppException, AuthResponseEntity>> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      final customer = await remoteDataSource.authenticate(
        email: email,
        password: password,
      );

      return Right(customer);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }
}
