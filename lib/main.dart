import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'good_flutter_app.dart';

void main() async {
  LogUtil.e("main is init");
  runApp(GoodFlutterApp());
  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
