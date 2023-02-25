import 'package:google_fonts/google_fonts.dart';
import 'package:pic_viewer/app/router/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final AppRouter rootRouter = AppRouter();

class PicViewerApp extends StatelessWidget {
  const PicViewerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: rootRouter.delegate(),
      builder: (context, child) => child ?? const SizedBox.shrink(),
      routeInformationParser: rootRouter.defaultRouteParser(),
      localizationsDelegates: [
        ...context.localizationDelegates,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
