import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:test_ia/core/consts/secure_storage_keys.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/core/services/secure_storage_service.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';

abstract class DashboardLocalDataSource {
  Future<void> putCharacterLocally(RickAndMortyCharacter character);
  Future<void> putCharactersLocally(List<RickAndMortyCharacter> characters);
  Future<void> deleteCharacterLocally(RickAndMortyCharacter character);
  Future<void> logout();
}

@LazySingleton(as: DashboardLocalDataSource)
class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final SecureStorageService secureStorageService;

  DashboardLocalDataSourceImpl(this.secureStorageService);

  @override
  Future<void> putCharacterLocally(RickAndMortyCharacter character) async {
    try {
      await secureStorageService.put(
        character.id.toString(),
        jsonEncode(character.toJson()),
      );
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<void> deleteCharacterLocally(RickAndMortyCharacter character) async {
    try {
      await secureStorageService.delete(character.id.toString());
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<void> putCharactersLocally(
    List<RickAndMortyCharacter> characters,
  ) async {
    try {
      for (var item in characters) {
        await secureStorageService.put(
          item.id.toString(),
          jsonEncode(item.toJson()),
        );
      }
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await secureStorageService.delete(SecureStorageKeys.authData);
    } catch (e) {
      throw DefaultAppException();
    }
  }
}
