import 'package:pic_viewer/app/model/pic/entity/pic.dart';

abstract class PicRepository {
  Future<PicPageData> getPicPage({required int page, required int limit});

  Future<List<Pic>> search({required String author});
}
