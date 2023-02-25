import 'package:pic_viewer/app/model/pic/entity/pic.dart';

abstract class PicUseCase {
  Future<PicPageData> getPicPage({required int page, required int limit});
}
