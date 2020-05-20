import 'package:flutter/material.dart';
import 'package:good_flutter_app/router/index.dart';
//import 'package:xiaodemo/model/app_model.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print('MyPage init');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    var appModel = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage')
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            RaisedButton(
                child: Text("登录"),
                onPressed: () {
                  RouterHelper.push(context, '/login');
            }),
            Text('MyPage ')
          ],
        )
      ),
    );
  }
}