import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/login/domain/usecases/auth.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  final Auth _authRepository;
  LoginCubit(this._authRepository) : super(const LoginState.initial());

  Future<void> authenticateUser({
    required String email,
    required String password,
  }) async {
    emit(LoginState.loading());
    final result = await _authRepository(email: email, password: password);

    result.fold(
      (e) => emit(LoginState.error(error: e)),
      (res) => emit(LoginState.success()),
    );
  }
}
