import 'package:pic_viewer/app/app.dart';
import 'package:pic_viewer/app/assets/library_assets.dart';
import 'package:pic_viewer/app/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await _initializeAndLaunchApp();
}

Future<void> _initializeAndLaunchApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('pl'),
      ],
      path: LibraryAssets.getPath('translations'),
      fallbackLocale: const Locale('en'),
      child: const PicViewerApp(),
    ),
  );
}
