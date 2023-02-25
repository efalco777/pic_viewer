import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pic_viewer/app/di/di.dart';
import 'package:pic_viewer/app/model/pic/repository/api/pic_api.dart';
import 'package:pic_viewer/app/model/pic/repository/pic_repository_impl.dart';
import 'package:pic_viewer/app/model/pic/repository/pic_repostory.dart';

import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class RepositoriesModule {
  static void register(GetIt locator) {
    locator.registerLazySingleton(() => PicApi(_buildDio()));
    locator.registerLazySingleton<PicRepository>(() => PicRepositoryImpl(inject()));
  }

  static Dio _buildDio() {
    const timeout = Duration(seconds: 15);

    return Dio()
      ..options = BaseOptions(
        baseUrl: 'https://picsum.photos/v2/',
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveTimeout: timeout,
        contentType: ContentType.json.toString(),
      )
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
  }
}
