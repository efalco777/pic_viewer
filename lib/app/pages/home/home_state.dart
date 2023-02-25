import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    required HomeContent content,
    required PicPageData pageData,
    required int selectedPage,
    required int selectedLimit,
    required bool isChangingPage,
    required bool isInSearchMode,
    required bool isSearchInProgress,
    required String authorQuery,
    required List<Pic> searchResultPics,
  }) = _HomeState;

  List<Pic> get pics {
    if (isInSearchMode) {
      return searchResultPics;
    }
    return pageData.pics;
  }

}

@freezed
class HomeContent with _$HomeContent {
  const factory HomeContent.loading() = _Loading;
  const factory HomeContent.loaded() = _Loaded;
  const factory HomeContent.error() = _Error;
}
