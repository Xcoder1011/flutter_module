import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../pages/dialog_page.dart';
import '../pages/lifecycle_test_page.dart';
import '../pages/main_page.dart';
import '../pages/open_native.dart';
import '../pages/replacement_page.dart';

class SKRouter {
  // static const String mainPage = 'flutter_mainPage';
  // static const String simplePage = 'flutter_simplePage';
  // static const String flutterPage = 'flutter_flutterPage';

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'simplePage': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => const SimplePage(),
      );
    },
    'mainPage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            Object map = settings.arguments ?? '';
            return MainPage(
              data: map.toString(),
            );
          });
    },

    'tab1': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => const TabPage(
          color: Colors.cyan,
          title: 'Tab1',
        ),
      );
    },
    'tab2': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => const TabPage(
          color: Colors.green,
          title: 'Tab2',
        ),
      );
    },
    'tab3': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => const TabPage(
          color: Colors.orange,
          title: 'Tab3',
        ),
      );
    },

    ///生命周期例子页面
    'lifecyclePage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (ctx) {
            return const LifecycleTestPage();
          });
    },
    'replacementPage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (ctx) {
            return const ReplacementPage();
          });
    },

    ///透明弹窗页面
    'dialogPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(

        ///透明弹窗页面这个需要是false
          opaque: false,

          ///背景蒙版颜色
          barrierColor: Colors.black12,
          settings: settings,
          pageBuilder: (_, __, ___) => const DialogPage());
    },
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


class TabPage extends StatelessWidget {
  final String title;
  final Color color;
  const TabPage({ Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Text(title ?? '', style: const TextStyle(fontSize: 25)),
      ),
    );
  }
}
