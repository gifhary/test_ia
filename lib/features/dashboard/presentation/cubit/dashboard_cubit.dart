import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';
import 'package:test_ia/features/dashboard/domain/usecases/delete_character.dart';
import 'package:test_ia/features/dashboard/domain/usecases/get_api_data.dart';
import 'package:test_ia/features/dashboard/domain/usecases/logout.dart';
import 'package:test_ia/features/dashboard/domain/usecases/update_character.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@singleton
class DashboardCubit extends Cubit<DashboardState> {
  final GetApiData _getApiData;
  final UpdateCharacter _updateCharacter;
  final DeleteCharacter _deleteCharacter;
  final Logout _logout;
  DashboardCubit(
    this._getApiData,
    this._updateCharacter,
    this._deleteCharacter,
    this._logout,
  ) : super(DashboardState.initial());

  int _allPage = 1;

  Future<void> fetchApi([int? page]) async {
    if ((page ?? 0) > _allPage) return;
    emit(DashboardState.loading());
    final res = await _getApiData(page);
    res.fold((e) => emit(DashboardState.error(error: e)), (data) {
      if (_allPage != data.info.pages) {
        _allPage = data.info.pages;
      }
      emit(DashboardState.success(pageItem: data.results));
    });
  }

  Future<void> updateCharacter(RickAndMortyCharacter char) async {
    emit(DashboardState.loading());
    final res = await _updateCharacter(char);
    res.fold(
      (e) => emit(DashboardState.error(error: e)),
      (data) => emit(DashboardState.successUpdate(char: char)),
    );
  }

  Future<void> deleteCharacter(RickAndMortyCharacter char) async {
    emit(DashboardState.loading());
    final res = await _deleteCharacter(char);
    res.fold(
      (e) => emit(DashboardState.error(error: e)),
      (_) => emit(DashboardState.successDelete(id: char.id)),
    );
  }

  Future<void> logout() async {
    emit(DashboardState.loading());
    final res = await _logout();
    res.fold(
      (e) => emit(DashboardState.error(error: e)),
      (_) => emit(DashboardState.successLogout()),
    );
  }
}
