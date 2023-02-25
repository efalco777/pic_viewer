import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:pic_viewer/app/model/pic/pic_use_case.dart';
import 'package:pic_viewer/app/pages/home/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final PicUseCase _useCase;

  HomeBloc(this._useCase)
      : super(
          const HomeState(
            content: HomeContent.loading(),
            pageData: PicPageData.empty,
            selectedPage: Pic.minPage,
            selectedLimit: Pic.minLimit,
            authorQuery: '',
            isChangingPage: false,
          ),
        );

  Future<void> refresh({bool silent = false, bool reset = false}) async {
    if (!silent) {
      emit(state.copyWith(content: const HomeContent.loading()));
    }
    try {
      final limit = reset ? Pic.minLimit : state.selectedLimit;
      final page = reset ? Pic.minPage : state.selectedPage;
      final author = reset ? '' : state.authorQuery;

      final pageData = await _useCase.getPicPage(
        limit: limit,
        page: page,
      );

      emit(state.copyWith(
        content: const HomeContent.loaded(),
        selectedPage: page,
        selectedLimit: limit,
        pageData: pageData,
        authorQuery: author,
        isChangingPage: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        content: const HomeContent.error(),
      ));
    }
  }

  void onPageChanged(int page) {
    emit(state.copyWith(
      selectedPage: page,
      isChangingPage: true,
    ));
    refresh(silent: true);
  }

  void onLimitChanged(int limit) {
    emit(state.copyWith(
      selectedPage: 1,
      selectedLimit: limit,
    ));
    refresh(silent: true);
  }

  void onSearchByAuthor(String authorQuery) {
    emit(state.copyWith(authorQuery: authorQuery));
  }

  void onSearchCancelled() {
    emit(state.copyWith(authorQuery: ''));
  }
}
