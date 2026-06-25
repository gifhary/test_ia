import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_ia/features/dashboard/data/models/api_info.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@freezed
abstract class ApiResponseModel with _$ApiResponseModel {
  const factory ApiResponseModel({
    required ApiInfo info,
    required List<RickAndMortyCharacter> results,
  }) = _ApiResponseModel;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);
}
