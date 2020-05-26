import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

/// Router Helper 路由的辅助类
///
class RouterHelper {
  static Router router;

  static void setRouter(Router r) {
    router = r;
    Routes.configureRoutes(router); // 路由配置
  }

  static Future push(BuildContext context, String path) {
    print('RouterHelper push: ' + path);
//    FocusScope.of(context).requestFocus(new FocusNode());
    return router?.navigateTo(context, path);
  }

  static pushAnd(BuildContext context, String path) {
    print('RouterHelper push: ' + path);
//    FocusScope.of(context).requestFocus(new FocusNode());
    router?.navigateTo(context, path);
  }


//  Application.router
//      .navigateTo(context, route, transition: transitionType)
//      .then((result) {
//  if (key == "pop-result") {
//  Application.router.navigateTo(context, "/demo/func?message=$result");
//  }
//  });



  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static replace(BuildContext context, String path) {
//    FocusScope.of(context).requestFocus(new FocusNode());
    router?.navigateTo(context, path, replace: true);
  }

  static pushWeb(BuildContext context, String title, String url) {
    push(context, "/web?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}");
  }

  static pushLogin(BuildContext context) {
    push(context, "/login");
  }

}
