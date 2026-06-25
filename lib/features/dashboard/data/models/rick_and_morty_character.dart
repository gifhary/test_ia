import 'package:freezed_annotation/freezed_annotation.dart';

part 'rick_and_morty_character.freezed.dart';
part 'rick_and_morty_character.g.dart';

@freezed
abstract class RickAndMortyCharacter with _$RickAndMortyCharacter {
  const factory RickAndMortyCharacter({
    required int id,
    String? name,
    String? status,
  }) = _RickAndMortyCharacter;

  factory RickAndMortyCharacter.fromJson(Map<String, dynamic> json) =>
      _$RickAndMortyCharacterFromJson(json);
}
