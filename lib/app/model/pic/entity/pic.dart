import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_viewer/app/model/pic/entity/pic_keys.dart';

part 'pic.freezed.dart';
part 'pic.g.dart';

@freezed
class Pic with _$Pic {
  static const minPage = 1;

  static const minLimit = 25;
  static const maxLimit = 100;

  const Pic._();

  const factory Pic({
    @JsonKey(name: PicKeys.id) required String id,
    @JsonKey(name: PicKeys.author) required String author,
    @JsonKey(name: PicKeys.width) required double width,
    @JsonKey(name: PicKeys.height) required double height,
    @JsonKey(name: PicKeys.url) required String url,
    @JsonKey(name: PicKeys.downloadUrl) required String downloadUrl,
  }) = _Pic;

  factory Pic.fromJson(Map<String, dynamic> json) => _$PicFromJson(json);

  String get thumbnailUrl {
    final urlPrefix = downloadUrl.split('/$id/').first;

    final imageHeight = height ~/ 5;
    final imageWidth = width ~/ 5;

    return '$urlPrefix/$id/$imageWidth/$imageHeight';
  }
}

@freezed
class PicPageData with _$PicPageData {
  static const PicPageData empty = PicPageData(
    pics: [],
    isNextPageAvailable: false,
  );

  const factory PicPageData({
    required List<Pic> pics,
    required bool isNextPageAvailable,
  }) = _PicPageData;
}
