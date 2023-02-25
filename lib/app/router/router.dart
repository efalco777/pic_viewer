import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:pic_viewer/app/pages/home/home_page.dart';
import 'package:pic_viewer/app/pages/pic_details/pic_details_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(
    path: '/',
    page: HomePage,
    initial: true,
  ),
  AutoRoute(
    path: '/pic',
    page: PicDetailsPage,
    initial: true,
    fullscreenDialog: true,
  ),
])
class AppRouter extends _$AppRouter {}
