import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_data_entity.freezed.dart';
part 'auth_response_data_entity.g.dart';

@freezed
abstract class AuthResponseDataEntity with _$AuthResponseDataEntity {
  const factory AuthResponseDataEntity({
    required String accessToken,
    required String tokenType,
    required int expiresIn,
    required String refreshToken,
  }) = _AuthResponseDataEntity;

  factory AuthResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDataEntityFromJson(json);
}
