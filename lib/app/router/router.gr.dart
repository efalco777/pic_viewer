// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PicDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PicDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PicDetailsPage(
          key: args.key,
          pic: args.pic,
        ),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          PicDetailsRoute.name,
          path: '/pic',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [PicDetailsPage]
class PicDetailsRoute extends PageRouteInfo<PicDetailsRouteArgs> {
  PicDetailsRoute({
    Key? key,
    required Pic pic,
  }) : super(
          PicDetailsRoute.name,
          path: '/pic',
          args: PicDetailsRouteArgs(
            key: key,
            pic: pic,
          ),
        );

  static const String name = 'PicDetailsRoute';
}

class PicDetailsRouteArgs {
  const PicDetailsRouteArgs({
    this.key,
    required this.pic,
  });

  final Key? key;

  final Pic pic;

  @override
  String toString() {
    return 'PicDetailsRouteArgs{key: $key, pic: $pic}';
  }
}
