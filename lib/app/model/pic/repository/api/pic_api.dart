import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:retrofit/retrofit.dart';

part 'pic_api.g.dart';

@RestApi()
abstract class PicApi {
  factory PicApi(Dio dio) = _PicApi;

  @GET('/list')
  Future<HttpResponse<List<Pic>>> getPics({
    @Query('limit') required int limit,
    @Query('page') required int page,
  });
}
