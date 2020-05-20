import 'package:flutter/material.dart';

class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print('CinemaPage init');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    var appModel = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CinemaPage')
      ),
      body: Container(
        child: Text('CinemaPage ')
      ),
    );
  }
}