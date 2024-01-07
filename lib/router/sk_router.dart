import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../pages/flutter_page.dart';
import '../pages/main_page.dart';
import '../pages/open_native.dart';

class SKRouter {
  static const String mainPage = 'flutter_mainPage';
  static const String simplePage = 'flutter_simplePage';
  static const String flutterPage = 'flutter_flutterPage';

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    simplePage: (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            return const SimplePage();
          });
    },
    mainPage: (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            Map<String, dynamic> map =
            settings.arguments as Map<String, dynamic>;
            String str = map['title'];
            str ??= '';
            return MainPage(
              data: str,
            );
          });
    },
    flutterPage: (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            return FlutterRouteWidget(
              params: settings.arguments as Map<dynamic, dynamic>?,
              uniqueId: uniqueId,
            );
          });
    }
  };

  static FlutterBoostRouteFactory routeFactory =
      (RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  };
}