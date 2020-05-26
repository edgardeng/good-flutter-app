import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/common/constant.dart';
import 'package:good_flutter_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  final _list = ['跟随系统', '开启', '关闭'];
//  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SpUtil.getInstance();
    });
  }
//
//  @override
//  void dispose() {
//    _subscription?.cancel();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    String theme = SpUtil.getString(APP_THEME);
    String themeMode;
    switch(theme) {
      case 'Dark':
        themeMode = _list[1];
        break;
      case 'Light':
        themeMode = _list[2];
        break;
      default:
        themeMode = _list[0];
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('夜间模式'),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          itemCount: _list.length,
          separatorBuilder: (_, index) {
            return const Divider();
          },
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                ThemeMode themeMode = index == 0 ? ThemeMode.system : (index == 1 ? ThemeMode.dark : ThemeMode.light);
//                Provider.of<ThemeProvider>(context, listen: false).setTheme(themeMode);
                /// 与上方等价，provider 4.1.0添加的拓展方法
                context.read<ThemeProvider>().setTheme(themeMode);
//                _subscription?.cancel();
//                /// 主题切换动画200毫秒
//                _subscription = Stream.value(1).delay(Duration(milliseconds: 200)).listen((_) {
//                  if (!mounted) {
//                    return;
//                  }
//                  ThemeUtils.setSystemNavigationBarStyle(context, themeMode);
//                });
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_list[index]),
                    ),
                    Opacity(
                        opacity: themeMode == _list[index] ? 1 : 0,
                        child: Icon(Icons.done, color: Colors.blue)
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}