import 'package:base_library/base_library.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/common/constant.dart';
import 'package:good_flutter_app/router/index.dart';
import 'package:good_flutter_app/router/routes.dart';


/// 设置页面
///
class SettingsPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    String theme = SpUtil.getString(APP_THEME);
    String themeMode;
    switch(theme) {
      case 'Dark':
        themeMode = '开启';
        break;
      case 'Light':
        themeMode = '关闭';
        break;
      default:
        themeMode = '跟随系统';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: Column(
        children: <Widget>[
          Gaps.vGap5,
          ClickItem(
              title: '夜间模式',
              content: themeMode,
              onTap: () => RouterHelper.push(context, Routes.settings_theme)
          ),
          ClickItem(
              title: '账号管理',
//              onTap: () => NavigatorUtils.push(context, SettingRouter.accountManagerPage)
          ),
          ClickItem(
              title: '清除缓存',
              content: '23.5MB',
              onTap: () {}
          ),

          ClickItem(
              title: '检查更新',
//              onTap: () => _showUpdateDialog()
          ),
          ClickItem(
              title: '关于我们',
//              onTap: () => NavigatorUtils.push(context, SettingRouter.aboutPage)
          )
        ],
      ),
    );
  }

//  void _showExitDialog() {
//    showDialog(
//        context: context,
//        builder: (_) => ExitDialog()
//    );
//  }
//
//  void _showUpdateDialog() {
//    showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (_) => UpdateDialog()
//    );
//  }
}