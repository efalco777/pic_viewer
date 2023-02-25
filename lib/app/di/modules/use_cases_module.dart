import 'package:pic_viewer/app/di/di.dart';
import 'package:pic_viewer/app/model/pic/pic_use_case.dart';
import 'package:pic_viewer/app/model/pic/pic_use_case_impl.dart';

import 'package:get_it/get_it.dart';

abstract class UseCasesModule {
  static void register(GetIt locator) {
    locator.registerLazySingleton<PicUseCase>(() => PicUseCaseImpl(inject()));
  }
}
