import 'package:dio/dio.dart'; // 1. Import Dio to use the real Response class
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_ia/core/services/http_client_service.dart';
import 'package:test_ia/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';

class MockHttpClientService extends Mock implements HttpClientService {}

void main() {
  late DashboardRemoteDataSourceImpl dataSource;
  late MockHttpClientService mockHttpClientService;

  setUp(() {
    mockHttpClientService = MockHttpClientService();
    dataSource = DashboardRemoteDataSourceImpl(mockHttpClientService);
  });

  final tMockJsonResponse = {
    'info': {'count': 826, 'pages': 42, 'next': 'https://...', 'prev': null},
    'results': [
      {'id': 1, 'name': 'Rick Sanchez', 'status': 'Alive'},
    ],
  };

  group('getApiData', () {
    test(
      'should return ApiResponseModel when the call to HttpClientService is successful',
      () async {
        // Arrange - Create a real Dio Response object populated with your mock JSON data
        final dioResponse = Response(
          data: tMockJsonResponse,
          requestOptions: RequestOptions(path: '/character'),
          statusCode: 200,
        );

        // Use the properly typed dioResponse here
        when(
          () => mockHttpClientService.get(
            path: any(named: 'path'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((_) async => dioResponse);

        // Act
        final result = await dataSource.getApiData(1);

        // Assert
        expect(result, isA<ApiResponseModel>());
        verify(
          () => mockHttpClientService.get(
            path: '/character',
            queryParameters: {'page': 1},
          ),
        ).called(1);
      },
    );

    test(
      'should rethrow an Exception when the call to HttpClientService fails',
      () async {
        // Arrange
        when(
          () => mockHttpClientService.get(
            path: any(named: 'path'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(Exception('Network Error'));

        // Act & Assert
        expect(() => dataSource.getApiData(1), throwsA(isA<Exception>()));
        verify(
          () => mockHttpClientService.get(
            path: '/character',
            queryParameters: {'page': 1},
          ),
        ).called(1);
      },
    );
  });
}
