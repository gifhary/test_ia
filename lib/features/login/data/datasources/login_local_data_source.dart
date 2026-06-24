import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:test_ia/core/consts/secure_storage_keys.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/core/services/secure_storage_service.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';

abstract class LoginLocalDataSource {
  Future<void> writeAuthData(AuthResponseEntity data);
}

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SecureStorageService secureStorageService;

  LoginLocalDataSourceImpl(this.secureStorageService);

  @override
  Future<void> writeAuthData(AuthResponseEntity data) async {
    try {
      await secureStorageService.put(
        SecureStorageKeys.authData,
        jsonEncode(data.toJson()),
      );
    } catch (e) {
      throw DefaultAppException();
    }
  }
}
