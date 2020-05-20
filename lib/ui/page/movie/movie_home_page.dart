import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_flutter_app/ui/page/search/movie_search_delegate.dart';

import 'movie_home/home_list_view.dart';


class MovieHomePage extends StatefulWidget {
  final Widget child;

  MovieHomePage({Key key, this.child}) : super(key: key);

  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           brightness: Brightness.light,
           title: Text('首页'),
           backgroundColor: Color.fromARGB(1, 255, 255, 255),
          //  app bar 阴影
           elevation: 0,
           actions: <Widget>[
             IconButton(
               icon: Icon(Icons.search),
               onPressed:() => showSearch(context:context, delegate: SearchBarDelegate()),
             ),
           ],
         ),
         body: HomeListView()
       );
  }
}

