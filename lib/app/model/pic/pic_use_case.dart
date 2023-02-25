import 'package:pic_viewer/app/model/pic/entity/pic.dart';

abstract class PicUseCase {
  Future<PicPageData> getPicPage({int page = 1, int limit = 30});
}
