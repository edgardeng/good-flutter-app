import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/ui/page/user/login_page.dart';
import './route_handlers.dart';

/// 路由的配置
///
class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String web = "/web";
  static String video = "/video";
//  static String splash = "/splash";
  static String movieList = "/movie";
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return Text("404 !!!");
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: splashHandler);
    router.define(web, handler: webHandler);
    router.define(home, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(video, handler: vieoHandler);
    router.define(movieList, handler: movieListHandler);
    router.define("/movie/:id", handler: movieDetailHandler);
    router.define("/actor/:id", handler: actorDetailHandler);

//    router.define(demoSimpleFixedTrans,
//        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
  }
}
