import 'dart:convert';

import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:good_flutter_app/model/user.dart';
import 'dart:ui' as ui;

import 'package:good_flutter_app/res/colors.dart';
import 'package:good_flutter_app/router/index.dart';

class MyPage extends StatefulWidget {
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with RouteAware{

  User user;
  double navAlpha = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 200) {
        setState(() {
          navAlpha = 1;// - (200 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
    _loadUser();
  }
  @override
  void deactivate() {
    print('MyPage deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('MyPage build');
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              color: AppColor.white,
              height: Screen.height,
              width: Screen.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Text("设置")
//                  _buildHeader(),
//                  _buildItem('images/icon_github.png', '项目地址', _goGithub),
                ],
              )),
          // Container(color: pageColor,padding: EdgeInsets.symmetric(vertical: 300),),
//          _buildNavigationBar(),
        ],
      ),
    );
  }

  _goLogin() {
    RouterHelper.pushLogin(context);
  }
  _goGithub() {
    RouterHelper.pushWeb(context, 'good-flutter-app', 'https://github.com/edgardeng/good-flutter-app');
  }
  _goSetting() {
    RouterHelper.push(context, '/settings');
  }

  Widget _buildNavigationBar() {
    return Positioned(
      top: 0,
      child: Container(
        color: navAlpha == 0 ? Colors.transparent : Colors.white,
        width: Screen.width,
        height: Screen.navigationBarHeight,
        padding: EdgeInsets.fromLTRB(10, Screen.topSafeHeight, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          GestureDetector(onTap: _goSetting, child: Icon(Icons.settings, color: AppColor.white,)),
          GestureDetector(child: Icon(Icons.message, color: AppColor.white,))
          ],
        )
      )
    );

//      children: <Widget>[
//        Container(
//          width: 44,
//          height: Screen.navigationBarHeight,
//          padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
//          child: GestureDetector(onTap: _goSetting, child: Icon(Icons.arrow_back, color: AppColor.white,)),
//        ),
//        Opacity(
//          opacity: navAlpha,
//          child: Container(
//            decoration: BoxDecoration(color: pageColor),
//            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
//            height: Screen.navigationBarHeight,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  width: 44,
//                  child: GestureDetector(onTap: back, child: Icon(Icons.arrow_back)),
//                ),
//                Expanded(
//                  child: Text(
//                    movieDetail.title,
//                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.white),
//                    textAlign: TextAlign.center,
//                    overflow: TextOverflow.ellipsis,
//                  ),
//                ),
//                Container(width: 44),
//              ],
//            ),
//          ),
//        )
//      ],
//    );
  }

  Widget _buildItem(String icon, String text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: Screen.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.lightGrey, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  icon,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    double width = Screen.width;
    double height = 250;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF119793), Color(0xFF9ad6d4), Color(0xFFc2fd87)],
              begin: FractionalOffset(-1, -1),
              end: FractionalOffset(1, 1))
      ),
      child: _buildHeaderStack(),
    );
  }

  Widget _buildHeaderStack() {
    if (user != null) {
      double height = 200;
      return Column(
          children: [
        Image(
          image: CachedNetworkImageProvider(user.avatarUrl),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        Opacity(
          opacity: 0.7,
          child: Container(
              color: Colors.black, width: Screen.width, height: height),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
              width: Screen.width,
              height: height,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('MayanDev',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ))
                ],
              )),
        ),
      ]);
    }
    else {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            RoundButton(
                width: 200,
                style: TextStyle(color: AppColor.black),
                text: "账号登录",
              onPressed: _goLogin,
            ),
            Divider(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  child: new Icon(Icons.add_a_photo, color: AppColor.red,),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  onPressed: () {},
                  child: new Icon(Icons.add_a_photo),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  onPressed: () {},
                  child: new Icon(Icons.add_a_photo),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                )
              ],
            )

          ],
        ),
      );
    }

  }
  void _loadUser() {
    String jsonInfo = SpUtil.getString("user.info");
    if (jsonInfo != null) {
      User u = User.fromJson(json.decode(jsonInfo));
      setState(() {
        user = u;
      });
    }
    //  获取本地存储的版本 和 当前版本 比较
  }
}
