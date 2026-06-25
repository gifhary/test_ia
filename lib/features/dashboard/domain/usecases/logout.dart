import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';

import 'package:test_ia/features/dashboard/domain/repositories/dashboard_repository.dart';

@lazySingleton
class Logout {
  final DashboardRepository dashboardRepository;

  Logout(this.dashboardRepository);

  Future<Either<AppException, Unit>> call() async {
    final result = await dashboardRepository.logout();

    return result.fold((error) => Left(error), (u) => Right(u));
  }
}
