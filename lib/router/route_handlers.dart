import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/ui/page/index.dart';

/// 路由的处理
///

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var splashHandler = Handler(handlerFunc: (_, params) => SplashPage());
var loginHandler = Handler(handlerFunc: (_, params) => LoginPage());

var movieListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params["title"]?.first;
  String action = params["action"]?.first;
  return MovieListPage(title: title, action: action);
});

var movieDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MovieDetailPage(id: params["id"][0]);
});

var actorDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ActorDetailPage(id: params["id"][0]);
});

var webHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params["title"]?.first;
  String url = params["url"]?.first;
  return WebViewPage(title: title, url: url);
});

var vieoHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params["url"]?.first;
  return MovieVideoPage(url: url);
});

var citySelectHandler = Handler(handlerFunc: (_, params) => CitySelectPage());
var settingsHandler = Handler(handlerFunc: (_, params) => SettingsPage());
var settingsThemeHandler = Handler(handlerFunc: (_, params) => ThemePage());


//var demoRouteHandler = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String message = params["message"]?.first;
//  String colorHex = params["color_hex"]?.first;
//  String result = params["result"]?.first;
//  Color color = Color(0xFFFFFFFF);
//  if (colorHex != null && colorHex.length > 0) {
//    color = Color(ColorHelpers.fromHexString(colorHex));
//  }
//  return DemoSimpleComponent(message: message, color: color, result: result);
//});
//
//var demoFunctionHandler = Handler(
//    type: HandlerType.function,
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String message = params["message"]?.first;
//      showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Text(
//              "Hey Hey!",
//              style: TextStyle(
//                color: const Color(0xFF00D6F7),
//                fontFamily: "Lazer84",
//                fontSize: 22.0,
//              ),
//            ),
//            content: Text("$message"),
//            actions: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
//                child: FlatButton(
//                  onPressed: () {
//                    Navigator.of(context).pop(true);
//                  },
//                  child: Text("OK"),
//                ),
//              ),
//            ],
//          );
//        },
//      );
//    });
//
//
///// Handles deep links into the app
///// To test on Android:
/////
///// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
//var deepLinkHandler = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String colorHex = params["color_hex"]?.first;
//  String result = params["result"]?.first;
//  Color color = Color(0xFFFFFFFF);
//  if (colorHex != null && colorHex.length > 0) {
//    color = Color(ColorHelpers.fromHexString(colorHex));
//  }
//  return DemoSimpleComponent(
//      message: "DEEEEEP LINK!!!", color: color, result: result);
//});
