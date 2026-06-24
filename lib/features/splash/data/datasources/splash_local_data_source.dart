import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/consts/secure_storage_keys.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/core/services/secure_storage_service.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';

abstract class SplashLocalDataSource {
  Future<AuthResponseEntity> readAuthData();
}

@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SecureStorageService secureStorageService;

  SplashLocalDataSourceImpl(this.secureStorageService);

  @override
  Future<AuthResponseEntity> readAuthData() async {
    try {
      final result = await secureStorageService.get(SecureStorageKeys.authData);
      return AuthResponseEntity.fromJson(jsonDecode(result as String));
    } catch (e) {
      debugPrint('error: $e');
      throw DefaultAppException();
    }
  }
}
