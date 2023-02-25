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
}
