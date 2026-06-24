import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';
import 'package:test_ia/features/splash/data/datasources/splash_local_data_source.dart';
import 'package:test_ia/features/splash/domain/repositories/splash_repository.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDataSource localDataSource;

  SplashRepositoryImpl(this.localDataSource);

  @override
  Future<Either<AppException, AuthResponseEntity>> readLocalAuthData() async {
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
}
