import 'package:flutter/material.dart';
import 'package:good_flutter_app/res/colors.dart';
import 'package:good_flutter_app/res/icons.dart';

import 'movie/cinema_page.dart';
import 'movie/movie_home_page.dart';
import 'movie/movie_rank_page.dart';
import 'user/my_page.dart';

/// 首页 - 4个标签：
///

class BottomBarItem {
  BottomBarItem({this.title, this.name, this.icon, this.widget});

  final String title;
  final String name;
  final Icon icon;
  final Widget widget;
}

final List<BottomBarItem> _bottomBarItems = <BottomBarItem>[
  BottomBarItem(
      title: '电影',
      name: 'HomePage',
      icon: Icon(XDIcons.movie),
      widget: MovieHomePage()),
  BottomBarItem(
      title: '榜单',
      name: 'rank',
      icon: Icon(XDIcons.super_star),
      widget: MovieRankPage()),
  BottomBarItem(
      title: '影院',
      name: 'star',
      icon: Icon(XDIcons.cinema),
      widget: CinemaPage()),
  BottomBarItem(
      title: '我的',
      name: 'personal',
      icon: Icon(XDIcons.personal),
      widget: MyPage()),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
//    eventCenter.on('switchTab', _onSwitchTab);
  }

//  List<Widget> _pageList = [HomePage(), CategoryPage(), CartPage(), UserPage()];
//  List<BottomNavigationBarItem>

  void _onTapBottomBar(int index) {
    _pageController.jumpToPage(index);
  }

//  void _onSwitchTab(Event e) {
//    if (e.data == null) return;
//    final String name = e.data;
//    for (var i = 0; i < _bottomBarItems.length; i++) {
//      if (name == _bottomBarItems[i].name) {
//        _pageController.jumpToPage(i);
//      }
//    }
//  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _bottomBarItems.map((BottomBarItem bottomBarItem) {
          return bottomBarItem.widget;
        }).toList(),
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
//        selectedIconTheme: IconThemeData(color: AppColor.primary),
//        selectedLabelStyle: TextStyle(color: AppColor.primary),
        selectedItemColor: AppColor.primary,
        items: _bottomBarItems.map((BottomBarItem bottomBarItem) {
          return BottomNavigationBarItem(
              icon: bottomBarItem.icon, title: Text(bottomBarItem.title));
        }).toList(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // 大于3个底部导航需要设置fixed定位
        onTap: _onTapBottomBar,
        selectedFontSize: 12.0, // 字体默认12.0，选中时放大为14.0
      ),
    );
  }

  @override
  void dispose() {
//    eventCenter.off('switchTab', _onSwitchTab);
    super.dispose();
  }
}
