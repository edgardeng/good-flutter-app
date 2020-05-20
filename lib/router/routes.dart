import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/ui/page/user/login_page.dart';
import './route_handlers.dart';

/// 路由的配置
///
class Routes {
  static String root = "/";
  static String login = "/login";
  static String splash = "/splash";

//  static String demoSimpleFixedTrans = "/demo/fixedtrans";
//  static String demoFunc = "/demo/func";
//  static String deepLink = "/message";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return Text("404 !!!");
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(login, handler: loginHandler);
    router.define(root, handler: rootHandler);

//    router.define(demoSimple, handler: demoRouteHandler);
//    router.define(demoSimpleFixedTrans,
//        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
//    router.define(demoFunc, handler: demoFunctionHandler);
//    router.define(deepLink, handler: deepLinkHandler);
  }
}
