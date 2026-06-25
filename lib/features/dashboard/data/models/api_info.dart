import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_info.freezed.dart';
part 'api_info.g.dart';

@freezed
abstract class ApiInfo with _$ApiInfo {
  const factory ApiInfo({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _ApiInfo;

  factory ApiInfo.fromJson(Map<String, dynamic> json) =>
      _$ApiInfoFromJson(json);
}
