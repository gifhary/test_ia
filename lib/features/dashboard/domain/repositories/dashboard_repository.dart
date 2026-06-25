import 'package:dartz/dartz.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';

abstract class DashboardRepository {
  Future<Either<AppException, ApiResponseModel>> getApiData([int? page]);
  Future<Either<AppException, Unit>> putCharacterLocally(
    RickAndMortyCharacter character,
  );
  Future<Either<AppException, Unit>> deleteCharacterLocally(
    RickAndMortyCharacter character,
  );
  Future<Either<AppException, Unit>> putCharactersLocally(
    List<RickAndMortyCharacter> characters,
  );
}
