import 'package:injectable/injectable.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_entity.dart';

abstract class LoginRemoteDataSource {
  Future<AuthResponseEntity> authenticate({
    required String email,
    required String password,
  });
}

@LazySingleton(as: LoginRemoteDataSource)
class PosProfileLocalDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<AuthResponseEntity> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(milliseconds: 200));

      return AuthResponseEntity.fromJson({
        "status": "success",
        "data": {
          "access_token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0NSIsImV4cCI6MTgwMDAwMDAwMH0...",
          "token_type": "Bearer",
          "expires_in": 3600,
          "refresh_token": "rF3k9Xm2Pq7ZsWv8N_example_refresh_token",
        },
      });
    } catch (e) {
      rethrow;
    }
  }
}
