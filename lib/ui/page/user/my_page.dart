import 'dart:convert';

import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:good_flutter_app/common/config.dart';
import 'package:good_flutter_app/common/constant.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/res/icons.dart';
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
                  Gaps.vGap10,
                  ClickItem(
                    icon: Icon(XDIcons.github),
                    title: 'Github',
                    onTap: () => RouterHelper.pushWeb(context, 'good-flutter-app', 'https://github.com/edgardeng/good-flutter-app')
                  ),
                  ClickItem(icon: Icon(XDIcons.sofa), title: '看电影', onTap: (){} ),
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
                  Gaps.vGap5,
                  Center(child: Text("版本 v" + Config.versionName, style: TextStyle(),)),
                  Opacity(
                      opacity: user != null ? 1 : 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: RoundButton(
                          text: "账号退出",
                          bgColor: Colors.deepOrange,
                          onPressed: _logout,
                        ),
                      ))
                ],
              )),
          // Container(color: pageColor,padding: EdgeInsets.symmetric(vertical: 300),),
          _buildNavigationBar(),
        ],
      ),
    );
  }

  _goLogin() {
    RouterHelper.pushLogin(context).then((result){
      if (result) {
        _loadUser();
      }
    });
  }

  _goSetting() {
    RouterHelper.push(context, Routes.settings);
  }

  _logout() {
    SpUtil.remove(USER_INFO);
    setState(() {
      user = null;
    });
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
    return Container(
      width: Screen.width,
      height: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF57ff56), Color(0xFF00FF93), Color(0xFF9aeed4)],
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
            SizedBox(height: Screen.topSafeHeight + 45),
            ClipOval(
              child: CachedNetworkImage(
                  width: 120,
                  height: 120,
                  imageUrl: user.avatarUrl),
            ),
            Gaps.vGap15,
            Text(user.username,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)
            ),
            SizedBox(height: 35)
          ]);
    }
    else {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(30, Screen.topSafeHeight + 75, 30, 65),
        child: Column(
          children: <Widget>[
            RoundButton(
              width: 200,
              style: TextStyle(color: Colors.black),
              text: "账号登录",
              bgColor: Colors.white,
              onPressed: _goLogin,
            ),
            Divider(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "weixin",
                  onPressed: () {},
                  child: new Icon(XDIcons.weixin, color: Colors.green,),
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
                  child: Icon(XDIcons.weibo,color: Colors.red,),
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
