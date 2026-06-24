import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_data_entity.dart';
import 'package:test_ia/features/login/domain/entities/auth_response_status.dart';

part 'auth_response_entity.freezed.dart';
part 'auth_response_entity.g.dart';

@freezed
abstract class AuthResponseEntity with _$AuthResponseEntity {
  const factory AuthResponseEntity({
    required AuthResponseStatus status,
    required AuthResponseDataEntity data,
  }) = _AuthResponseEntity;

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseEntityFromJson(json);
}
