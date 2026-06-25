part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardInitial;
  const factory DashboardState.loading() = DashboardLoading;
  const factory DashboardState.success({
    required List<RickAndMortyCharacter> pageItem,
  }) = DashboardSuccess;
  const factory DashboardState.successDelete({required int id}) =
      DashboardSuccessDelete;
  const factory DashboardState.successUpdate({
    required RickAndMortyCharacter char,
  }) = DashboardSuccessUpdate;
  const factory DashboardState.error({required AppException error}) =
      DashboardError;
}
