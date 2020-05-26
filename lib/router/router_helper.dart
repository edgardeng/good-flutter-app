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
    return router?.navigateTo(context, path);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static popResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }

  static replace(BuildContext context, String path) {
    router?.navigateTo(context, path, replace: true);
  }

  static pushWeb(BuildContext context, String title, String url) {
    push(context, "/web?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}");
  }

  static pushLogin(BuildContext context) {
    return push(context, "/login");
  }

}
