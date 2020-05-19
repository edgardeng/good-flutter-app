import 'package:flutter/material.dart';
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
        child: Text('MyPage ')
      ),
    );
  }
}