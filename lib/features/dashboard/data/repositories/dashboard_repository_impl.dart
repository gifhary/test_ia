import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:test_ia/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';
import 'package:test_ia/features/dashboard/domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl(
    this.remoteDataSource, {
    required this.localDataSource,
  });

  @override
  Future<Either<AppException, ApiResponseModel>> getApiData([int? page]) async {
    try {
      final result = await remoteDataSource.getApiData(page);

      return Right(result);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> deleteCharacterLocally(
    RickAndMortyCharacter character,
  ) async {
    try {
      await localDataSource.deleteCharacterLocally(character);

      return Right(unit);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> putCharacterLocally(
    RickAndMortyCharacter character,
  ) async {
    try {
      await localDataSource.putCharacterLocally(character);

      return Right(unit);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> putCharactersLocally(
    List<RickAndMortyCharacter> characters,
  ) async {
    try {
      await localDataSource.putCharactersLocally(characters);

      return Right(unit);
    } on InternetConnectionException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on DefaultAppException catch (e) {
      return Left(e);
    }
  }
}
