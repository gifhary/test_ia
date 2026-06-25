import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';
import 'package:test_ia/features/dashboard/domain/repositories/dashboard_repository.dart';

@lazySingleton
class GetApiData {
  final DashboardRepository dashboardRepository;

  GetApiData(this.dashboardRepository);

  Future<Either<AppException, ApiResponseModel>> call([int? page]) async {
    final result = await dashboardRepository.getApiData(page);

    return result.fold((error) => Left(error), (data) => Right(data));
  }
}
