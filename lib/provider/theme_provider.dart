import 'dart:ui';

import 'package:base_library/base_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/common/constant.dart';

/// 主题
///
class ThemeProvider extends ChangeNotifier {

  static const Map<ThemeMode, String> themes = {
    ThemeMode.dark: 'Dark', ThemeMode.light : 'Light', ThemeMode.system : 'System'
  };


  void syncTheme() {
    var theme = SpUtil.getString(APP_THEME);
    if (theme.isNotEmpty && theme != themes[ThemeMode.system]) {
      notifyListeners();
    }
  }

  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(APP_THEME, themes[themeMode]);
    notifyListeners();
  }

  ThemeMode getThemeMode(){
    var theme = SpUtil.getString(APP_THEME);
    switch(theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
        errorColor: isDarkMode ? Colors.red : Colors.red,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: isDarkMode ? Colours.dark_primary : Colours.primary,
        accentColor: isDarkMode ? Colours.dark_accent : Colours.accent,
        backgroundColor: isDarkMode ? Colours.dark_app_bg : Colours.app_bg,
        // Tab指示器颜色
//        indicatorColor: isDarkMode ? Colors.dark_app_main : Colors.app_main,
        // 页面背景色
//        scaffoldBackgroundColor: isDarkMode ? Colors.dark_bg_color : Colors.white,
        // 主要用于Material背景色
//        canvasColor: isDarkMode ? Colors.dark_material_bg : Colors.white,
        // 文字选择色（输入框复制粘贴菜单）
//        textSelectionColor: Colors.app_main.withAlpha(70),
//        textSelectionHandleColor: Colors.app_main,
        textTheme: TextTheme(
          // TextField输入文字颜色
          subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
          // Text文字样式
          bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
          subtitle2: isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: isDarkMode ? Colours.dark_bg_color : Colors.white,
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ),
        dividerTheme: DividerThemeData(
            color: isDarkMode ? Colours.dark_line : Colours.line,
            space: 0.6,
            thickness: 0.6
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        )
    );
  }

}