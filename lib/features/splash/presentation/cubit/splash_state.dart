part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = SplashInitial;
  const factory SplashState.loading() = SplashLoading;
  const factory SplashState.success() = SplashSuccess;
  const factory SplashState.error({required AppException error}) = SplashError;
}
