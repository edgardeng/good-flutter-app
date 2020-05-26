import 'dart:convert';

import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/common/constant.dart';
import 'package:good_flutter_app/data/api/api_client.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/router/index.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            Util.getImgPath("ic_login_bg"),
            package: BaseConstant.packageBase,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          new LoginBody(),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.grey),
              onPressed: () { RouterHelper.pop(context); },
            ),
          )
        ],
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();

    _controllerName.text = 'test'; // SpUtil.getString(BaseConstant.keyUserName, defValue: );
    _controllerPwd.text = '123456';

    void _userLogin() async {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      if (username.isEmpty || username.length < 4) {
        Util.showSnackBar(context, username.isEmpty ? "请输入用户名～" : "用户名至少6位～");
        return;
      }
      if (password.isEmpty || password.length < 6) {
        Util.showSnackBar(context, username.isEmpty ? "请输入密码～" : "密码至少6位～");
        return;
      }
      ApiClient apiClient = new ApiClient();
      User user = await apiClient.login(username, password);
      if (user != null) {
        SpUtil.putString(USER_INFO, json.encode(user.toJson()));
        Future.delayed(new Duration(milliseconds: 500), () {
          RouterHelper.pop(context);
        });
      } else {
        Util.showSnackBar(context, "用户名或密码错误");
        return;
      }
    }

    return new Column(
      children: <Widget>[
        new Expanded(child: new Container()),
        new Expanded(
            child: new Container(
              margin: EdgeInsets.only(left: 20, top: 15, right: 20),
              child: new Column(
                children: <Widget>[
                  LoginItem(
                    controller: _controllerName,
                    prefixIcon: Icons.person,
                    hintText: "用户名",
                  ),
                  Gaps.vGap15,
                  LoginItem(
                    controller: _controllerPwd,
                    prefixIcon: Icons.lock,
                    hasSuffixIcon: true,
                    hintText: "密码",
                  ),
                  new RoundButton(
//                    bgColor: Colors.primary,
                    text: "登录",
                    margin: EdgeInsets.only(top: 20),
                    onPressed: () {
                      _userLogin();
                    },
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
