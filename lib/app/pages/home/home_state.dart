import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_viewer/app/common/extensions/string_extension.dart';
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
    required String authorQuery,
  }) = _HomeState;

  List<Pic> get pics {
    if (authorQuery.isNotEmpty) {
      final query = authorQuery.toSearchQuery();
      return pageData.pics.where((e) {
        final author = e.author.toSearchQuery();
        return author.contains(query);
      }).toList();
    }
    return pageData.pics;
  }

  bool get isInSearchMode => authorQuery.isNotEmpty;
}

@freezed
class HomeContent with _$HomeContent {
  const factory HomeContent.loading() = _Loading;
  const factory HomeContent.loaded() = _Loaded;
  const factory HomeContent.error() = _Error;
}
