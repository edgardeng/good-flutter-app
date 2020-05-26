import 'dart:convert';

import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:good_flutter_app/common/constant.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/res/icons.dart';
import 'dart:ui' as ui;
import 'package:good_flutter_app/router/index.dart';

class MyPage extends StatefulWidget {
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with RouteAware{
  User user;
  int navAlpha = 0;

  @override
  void initState() {
    super.initState();
    print('MyPage initState');
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
              height: Screen.height,
              width: Screen.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  _buildHeader(),
                  Divider(height: 20, color: Colors.transparent,),
                  ClickItem(
                    icon: Icon(XDIcons.github),
                    title: 'Github',
                    onTap: () => RouterHelper.pushWeb(context, 'good-flutter-app', 'https://github.com/edgardeng/good-flutter-app')
                  ),
                  Gaps.vGap5,
                  ClickItem(icon: Icon(XDIcons.sofa), title: '看电影', onTap: (){} ),
                  Gaps.vGap5,
                  ClickItem(
                    icon: Icon(Icons.edit),
                      title: '我的发布',
                      onTap: (){}
                  ),
                  ClickItem(
                      icon: Icon(Icons.event_note, color:Colors.cyan),
                      title: '我的日记',
                      onTap: (){}
                  ),
                  ClickItem(
                      icon: Icon(Icons.favorite_border, color:Colors.deepOrange),
                      title: '我的关注',
                      onTap: (){}
                  ),
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

  _goSetting() {
    RouterHelper.push(context, Routes.settings);
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
                GestureDetector(onTap: _goSetting, child: Icon(Icons.settings, color: Colors.white,)),
                GestureDetector(child: Icon(Icons.message, color: Colors.white,))
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
      print('_buildHeaderStack:' + user.username);
      return Column(
          children: [
            SizedBox(height: Screen.topSafeHeight + 35),
            ClipOval(
              child: CachedNetworkImage(imageUrl: user.avatarUrl),
              //头像半径
              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
//              backgroundImage: Image(CachedNetworkImage(imageUrl: user.avatarUrl)),
            ),
            Gaps.vGap15,
            Text(user.username,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)
            ),
            SizedBox(height: 25)
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
              style: TextStyle(color: Colors.black),
              text: "账号登录",
              onPressed: _goLogin,
            ),
            Divider(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "weixin",
                  onPressed: () {},
                  child: new Icon(XDIcons.weixin),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "phone",
                  onPressed: () {},
                  child: new Icon(Icons.phone_android, color: Colors.blue,),
                  elevation: 1,
                  highlightElevation: 2.0,
                  backgroundColor: Colors.white,        // 红色
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "weibo",
                  onPressed: () {},
                  child: Icon(XDIcons.weibo),
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
    print('is _loadUser');
    String jsonInfo = SpUtil.getString(USER_INFO);
    if (jsonInfo != null) {
      User u = User.fromJson(json.decode(jsonInfo));
      setState(() {
        user = u;
      });
    }
    //  获取本地存储的版本 和 当前版本 比较
  }

}
