import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/env/env.dart';

@module
abstract class RegisterModule {
  FlutterSecureStorage get storage => const FlutterSecureStorage();
  Dio dio() => Dio(BaseOptions(baseUrl: Env.apiEndpoint));
  Connectivity get connectivity => Connectivity();
}
