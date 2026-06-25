import 'package:dartz/dartz.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';

abstract class DashboardRepository {
  Future<Either<AppException, ApiResponseModel>> getApiData([int? page]);
}
