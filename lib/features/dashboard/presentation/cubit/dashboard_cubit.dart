import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/features/dashboard/data/models/rick_and_morty_character.dart';
import 'package:test_ia/features/dashboard/domain/usecases/get_api_data.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@singleton
class DashboardCubit extends Cubit<DashboardState> {
  final GetApiData getApiData;
  DashboardCubit(this.getApiData) : super(DashboardState.initial());

  int _allPage = 1;

  Future<void> fetchApi([int? page]) async {
    if ((page ?? 0) > _allPage) return;
    emit(DashboardState.loading());
    final res = await getApiData(page);
    debugPrint('res: $res');
    res.fold((e) => emit(DashboardState.error(error: e)), (data) {
      if (_allPage != data.info.pages) {
        _allPage = data.info.pages;
      }
      emit(DashboardState.success(pageItem: data.results));
    });
  }
}
