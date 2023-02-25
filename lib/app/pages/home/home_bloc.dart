import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_viewer/app/common/extensions/string_extension.dart';
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
            selectedLimit: Pic.minPageLimit,
            authorQuery: '',
            isChangingPage: false,
            isSearchInProgress: false,
            isInSearchMode: false,
            searchResultPics: [],
          ),
        );

  Future<void> refresh({bool silent = false, bool reset = false}) async {
    if (!silent) {
      emit(state.copyWith(content: const HomeContent.loading()));
    }
    try {
      final limit = reset ? Pic.minPageLimit : state.selectedLimit;
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

  void onAuthorQueryChanged(String query) {
    emit(state.copyWith(authorQuery: query));
  }

  Future<void> onSearchStarted() async {
    final query = state.authorQuery.toSearchQuery();
    if (query.isEmpty) return;

    emit(state.copyWith(
      isSearchInProgress: true,
      searchResultPics: [],
    ));
    try {
      final List<Pic> matchedPics = [];
      int page = 0;
      while (true) {
        final pageData = await _useCase.getPicPage(
          limit: Pic.maxPageLimit,
          page: page++,
        );

        final temp = pageData.pics.where((e) {
          return e.author.toSearchQuery().contains(query);
        }).toList();

        matchedPics.addAll(temp);
        if (!pageData.isNextPageAvailable) break;
      }

      emit(state.copyWith(
        searchResultPics: matchedPics,
        isInSearchMode: true,
        isSearchInProgress: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        content: const HomeContent.error(),
      ));
    }
  }

  void onSearchCancelled() {
    emit(state.copyWith(
      authorQuery: '',
      searchResultPics: [],
      isSearchInProgress: false,
      isInSearchMode: false,
    ));
  }
}
