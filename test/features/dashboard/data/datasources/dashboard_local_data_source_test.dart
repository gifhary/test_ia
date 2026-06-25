import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/core/services/secure_storage_service.dart';
import 'package:test_ia/features/dashboard/data/datasources/dashboard_local_data_source.dart'; // Adjust path
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart'; // Adjust path

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  late DashboardLocalDataSourceImpl dataSource;
  late MockSecureStorageService mockSecureStorageService;

  setUp(() {
    mockSecureStorageService = MockSecureStorageService();
    dataSource = DashboardLocalDataSourceImpl(mockSecureStorageService);
  });

  // Sample model for testing
  final tCharacter = RickAndMortyCharacter(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
  );
  final tCharacter2 = RickAndMortyCharacter(
    id: 2,
    name: 'Morty Smith',
    status: 'Alive',
  );

  group('putCharacterLocally', () {
    test(
      'should call secureStorageService.put with correct key and jsonEncoded value',
      () async {
        // Arrange
        when(
          () => mockSecureStorageService.put(any(), any()),
        ).thenAnswer((_) async => Future.value());

        // Act
        await dataSource.putCharacterLocally(tCharacter);

        // Assert
        verify(
          () => mockSecureStorageService.put(
            tCharacter.id.toString(),
            jsonEncode(tCharacter.toJson()),
          ),
        ).called(1);
      },
    );

    test(
      'should throw DefaultAppException when secureStorageService.put fails',
      () async {
        // Arrange
        when(
          () => mockSecureStorageService.put(any(), any()),
        ).thenThrow(Exception('Storage error'));

        // Act & Assert
        expect(
          () => dataSource.putCharacterLocally(tCharacter),
          throwsA(isA<DefaultAppException>()),
        );
      },
    );
  });

  group('deleteCharacterLocally', () {
    test('should call secureStorageService.delete with correct key', () async {
      // Arrange
      when(
        () => mockSecureStorageService.delete(any()),
      ).thenAnswer((_) async => Future.value());

      // Act
      await dataSource.deleteCharacterLocally(tCharacter);

      // Assert
      verify(
        () => mockSecureStorageService.delete(tCharacter.id.toString()),
      ).called(1);
    });

    test(
      'should throw DefaultAppException when secureStorageService.delete fails',
      () async {
        // Arrange
        when(
          () => mockSecureStorageService.delete(any()),
        ).thenThrow(Exception('Storage error'));

        // Act & Assert
        expect(
          () => dataSource.deleteCharacterLocally(tCharacter),
          throwsA(isA<DefaultAppException>()),
        );
      },
    );
  });

  group('putCharactersLocally', () {
    test(
      'should call secureStorageService.put for each item in the list',
      () async {
        // Arrange
        when(
          () => mockSecureStorageService.put(any(), any()),
        ).thenAnswer((_) async => Future.value());
        final characterList = [tCharacter, tCharacter2];

        // Act
        await dataSource.putCharactersLocally(characterList);

        // Assert
        verify(
          () => mockSecureStorageService.put(
            tCharacter.id.toString(),
            jsonEncode(tCharacter.toJson()),
          ),
        ).called(1);

        verify(
          () => mockSecureStorageService.put(
            tCharacter2.id.toString(),
            jsonEncode(tCharacter2.toJson()),
          ),
        ).called(1);
      },
    );

    test(
      'should throw DefaultAppException when any loop iteration in secureStorageService.put fails',
      () async {
        // Arrange
        when(
          () => mockSecureStorageService.put(any(), any()),
        ).thenThrow(Exception('Storage loop error'));

        // Act & Assert
        expect(
          () => dataSource.putCharactersLocally([tCharacter]),
          throwsA(isA<DefaultAppException>()),
        );
      },
    );
  });
}
