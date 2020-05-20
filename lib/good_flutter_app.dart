import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:base_library/base_library.dart';
import 'package:good_flutter_app/router/index.dart';

class GoodFlutterApp extends StatefulWidget {
  @override
  State createState() => _AppState();
}

class _AppState extends State<GoodFlutterApp> {

  _AppState() {
    RouterHelper.setRouter(Router());// 全局静态
    LogUtil.e("_AppState Init ");
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("sp is init ${SpUtil.isInitialized()}");

    final app = MaterialApp(
      title: 'Good Flutter App',
      debugShowCheckedModeBanner: false, // 显示bug标志
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF57bd56),
      ),
      onGenerateRoute: RouterHelper.router.generator,
    );

    print("initial route = ${app.initialRoute}");
    return app;
  }
}