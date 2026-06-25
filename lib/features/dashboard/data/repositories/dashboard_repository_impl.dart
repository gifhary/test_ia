import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:test_ia/features/dashboard/data/models/api_response_model.dart';
import 'package:test_ia/features/dashboard/domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

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
}
