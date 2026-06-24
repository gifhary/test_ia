import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/splash/domain/usecases/check_auth.dart';

part 'splash_state.dart';

part 'splash_cubit.freezed.dart';

@singleton
class SplashCubit extends Cubit<SplashState> {
  final CheckAuth checkAuth;
  SplashCubit(this.checkAuth) : super(const SplashState.initial());

  Future<void> checkIfUserAuthenticated() async {
    emit(SplashState.loading());

    final result = await checkAuth();

    result.fold(
      (e) => emit(SplashState.error(error: e)),
      (res) => emit(SplashState.success()),
    );
  }
}
