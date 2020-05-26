import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:base_library/base_library.dart';
import 'package:good_flutter_app/router/index.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

class GoodFlutterApp extends StatefulWidget {
  @override
  State createState() => _AppState();
}

class _AppState extends State<GoodFlutterApp> {

//  final ThemeData theme = null;

  _AppState() {
    RouterHelper.setRouter(Router());// 初始化路由
    LogUtil.e("_AppState Init ");
    SpUtil.getInstance(); // 初始化 SpUtil
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("sp is init ${SpUtil.isInitialized()}");

    return ChangeNotifierProvider<ThemeProvider> (
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (_, provider, __) {
            return MaterialApp(
              title: 'Good Flutter App',
//              showPerformanceOverlay: true, //显示性能标签
              // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
              // checkerboardRasterCacheImages: true,
              // showSemanticsDebugger: true, // 显示语义视图
              // checkerboardOffscreenLayers: true, // 检查离屏渲染
              theme: provider.getTheme(),
              darkTheme: provider.getTheme(isDarkMode: true),
              themeMode: provider.getThemeMode(),
          //    home: home ?? SplashPage(),
              onGenerateRoute: RouterHelper.router.generator,
              localizationsDelegates: const [ ],
              supportedLocales: const [ Locale('zh', 'CN'), Locale('en', 'US')],
              builder: (context, child) {
              /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
                return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), // 或者 MediaQueryData.fromWindow(WidgetsBinding.instance.window).copyWith(textScaleFactor: 1.0),
                child: child,
                );
              }
            );
          }
        )
    );
  }
}