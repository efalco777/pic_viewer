import 'package:pic_viewer/app/common/extensions/string_extension.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:pic_viewer/app/model/pic/repository/api/pic_api.dart';
import 'package:pic_viewer/app/model/pic/repository/pic_repostory.dart';

class PicRepositoryImpl extends PicRepository {
  final PicApi _api;

  PicRepositoryImpl(this._api);

  @override
  Future<PicPageData> getPicPage({required int page, required int limit}) async {
    final result = await _api.getPics(page: page, limit: limit);
    final isNextPageAvailable = result.response.headers.map['link']?.first.contains('rel="next"') ?? false;

    return PicPageData(pics: result.data, isNextPageAvailable: isNextPageAvailable);
  }

  @override
  Future<List<Pic>> search({required String author}) async {
    // Pic api doesn't provide us a search endpint, that's why we're doing it this way.
    // Request are cached.
    final List<Pic> matchedPics = [];
    int page = 0;
    while (true) {
      final pageData = await getPicPage(
        limit: Pic.maxPageLimit,
        page: page++,
      );

      final temp = pageData.pics.where((e) {
        return e.author.toSearchQuery().contains(author);
      }).toList();

      matchedPics.addAll(temp);
      if (!pageData.isNextPageAvailable) break;
    }
    return matchedPics;
  }
}
