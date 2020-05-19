import 'package:flutter/material.dart';

class StarPage extends StatefulWidget {
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print('StarPage init');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    var appModel = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('StarPage')
      ),
      body: Container(
        child: Text('StarPage ' )
      ),
    );
  }
}