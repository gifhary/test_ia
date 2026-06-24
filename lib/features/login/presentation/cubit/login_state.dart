part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.error({required AppException error}) = LoginError;
}
