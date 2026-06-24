import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';
import 'package:test_ia/features/splash/domain/repositories/splash_repository.dart';

@lazySingleton
class CheckAuth {
  final SplashRepository splashRepository;

  CheckAuth(this.splashRepository);

  Future<Either<AppException, AuthResponseEntity>> call() async {
    final result = await splashRepository.readLocalAuthData();

    return result.fold((error) => Left(error), (data) => Right(data));
  }
}
