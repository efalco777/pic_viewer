import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:pic_viewer/app/model/pic/pic_use_case.dart';
import 'package:pic_viewer/app/model/pic/repository/pic_repostory.dart';

class PicUseCaseImpl implements PicUseCase {
  final PicRepository _repository;

  PicUseCaseImpl(this._repository);

  @override
  Future<PicPageData> getPicPage({int page = 1, int limit = 30}) {
    return _repository.getPicPage(page: page, limit: limit);
  }
}
