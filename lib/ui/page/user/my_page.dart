import 'dart:convert';

import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:good_flutter_app/model/index.dart';
import 'dart:ui' as ui;

import 'package:good_flutter_app/res/colors.dart';
import 'package:good_flutter_app/router/index.dart';

class MyPage extends StatefulWidget {
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with RouteAware{
  User user;
  int navAlpha = 0;

  @override
  void deactivate() {
    print('MyPage deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('MyPage build');
//    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);
//    return Scaffold(
//      body: Container(
//          color: AppColor.white,
//          height: Screen.height,
//          width: Screen.width,
//          child: ListView(
//            padding: EdgeInsets.only(top: 0),
//            children: <Widget>[
//              _buildHeader(),
//              _buildItem('images/icon_github.png', '项目地址', _goGithub),
//            ],
//          )),
//    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: Screen.height,
              width: Screen.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  _buildHeader(),
                  Divider(height: 20, color: Colors.transparent,),
                  _buildItem('images/icon_github.png', '项目地址', _goGithub),
                ],
              )),
          // Container(color: pageColor,padding: EdgeInsets.symmetric(vertical: 300),),
          _buildNavigationBar(),
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

  Widget _buildItem(String icon, String text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Screen.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.white,
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
      print('_buildHeaderStack:' + user.nickname);
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
        padding: EdgeInsets.fromLTRB(30, Screen.topSafeHeight + 45, 30, 45),
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
                  heroTag: "qq",
                  onPressed: () {},
                  child: new Icon(Icons.add_a_photo, color: AppColor.red,),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "weixin",
                  onPressed: () {},
                  child: new Icon(Icons.add_a_photo),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "weibo",
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

  Future _loadUser() async {
    String jsonInfo = SpUtil.getString("user.info");
    if (jsonInfo != null) {
      User u = User.fromJson(json.decode(jsonInfo));
      setState(() {
        user = u;
      });
    }
    //  获取本地存储的版本 和 当前版本 比较
  }


//  Widget _buildHeader() {
//    double width = Screen.width;
//    double height = 250;
//    return Container(
//      width: width,
//      height: height,
//      child: Stack(
//        children: <Widget>[
//          Image(
//            image: CachedNetworkImageProvider(avatarUrl),
//            fit: BoxFit.cover,
//            width: Screen.width,
//            height: height,
//          ),
//          Opacity(
//            opacity: 0.7,
//            child: Container(
//                color: Colors.black, width: Screen.width, height: height),
//          ),
//          BackdropFilter(
//            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//            child: Container(
//                width: Screen.width,
//                height: height,
//                color: Colors.transparent,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    CircleAvatar(
//                      backgroundImage: CachedNetworkImageProvider(avatarUrl),
//                      radius: 50.0,
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    Text('MayanDev',
//                        style: TextStyle(
//                          fontSize: 18,
//                          fontWeight: FontWeight.bold,
//                          color: AppColor.white,
//                        ))
//                  ],
//                )),
//          ),
//        ],
//      ),
//    );
//  }
}
