import 'package:injectable/injectable.dart';
import 'package:test_ia/core/services/http_client_service.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';

abstract class DashboardRemoteDataSource {
  Future<ApiResponseModel> getApiData([int? page]);
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final HttpClientService httpClientService;

  DashboardRemoteDataSourceImpl(this.httpClientService);

  @override
  Future<ApiResponseModel> getApiData([int? page]) async {
    try {
      final response = await httpClientService.get(
        path: '/character',
        queryParameters: {'page': page},
      );
      return ApiResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
