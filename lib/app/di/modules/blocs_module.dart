import 'package:pic_viewer/app/di/di.dart';
import 'package:pic_viewer/app/pages/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BlocsModule {
  static void register(GetIt locator) {
    locator.registerFactory(() => HomeBloc(inject()));
  }
}
