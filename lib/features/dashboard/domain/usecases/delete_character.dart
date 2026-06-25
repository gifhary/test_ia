import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';

import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';
import 'package:test_ia/features/dashboard/domain/repositories/dashboard_repository.dart';

@lazySingleton
class DeleteCharacter {
  final DashboardRepository dashboardRepository;

  DeleteCharacter(this.dashboardRepository);

  Future<Either<AppException, Unit>> call(
    RickAndMortyCharacter character,
  ) async {
    final result = await dashboardRepository.deleteCharacterLocally(character);

    return result.fold((error) => Left(error), (u) => Right(u));
  }
}
