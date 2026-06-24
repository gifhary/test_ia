import 'package:dartz/dartz.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';

abstract class SplashRepository {
  Future<Either<AppException, AuthResponseEntity>> readLocalAuthData();
}
