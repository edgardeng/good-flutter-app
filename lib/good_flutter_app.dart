import 'package:flutter/material.dart';

import 'package:base_library/base_library.dart';
import 'ui/page/user/login_page.dart';
import 'ui/page/home_page.dart';

class GoodFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogUtil.e("sp is init ${SpUtil.isInitialized()}");
    return new MaterialApp(
      routes: {
        BaseConstant.routeMain: (ctx) => HomePage(),
        BaseConstant.routeLogin: (ctx) => LoginPage(),
      },
      home: HomePage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF57bd56),
      ),
    );
  }
}
