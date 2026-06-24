import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';
import 'package:test_ia/features/login/domain/repositories/login_repository.dart';

@lazySingleton
class AddSaleItem {
  final LoginRepository loginRepository;

  AddSaleItem(this.loginRepository);

  Future<Either<AppException, AuthResponseEntity>> call({
    required String email,
    required String password,
  }) async {
    final result = await loginRepository.authenticate(
      email: email,
      password: password,
    );

    return result.fold(
      (error) =>
          Left(DefaultAppException(code: error.code, message: error.message)),
      (data) => Right(data),
    );
  }
}
