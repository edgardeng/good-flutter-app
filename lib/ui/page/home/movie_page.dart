import 'package:flutter/material.dart';
//import 'package:xiaodemo/model/app_model.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print('MoviePage init');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    var appModel = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MoviePage')
      ),
      body: Container(
        child: Text('MoviePage ')
      ),
    );
  }
}