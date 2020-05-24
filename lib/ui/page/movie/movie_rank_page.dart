import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_flutter_app/ui/page/search/movie_search_delegate.dart';

import 'movie_home/home_list_view.dart';
import 'movie_rank/movie_rank_list_view.dart';


class MovieRankPage extends StatefulWidget {
  final Widget child;

  MovieRankPage({Key key, this.child}) : super(key: key);

  _MovieRankPageState createState() => _MovieRankPageState();
}

class _MovieRankPageState extends State<MovieRankPage> {
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text('榜单'),
//           backgroundColor: Color.fromARGB(1, 255, 255, 255),
          //  app bar 阴影
           elevation: 0,
         ),
         body: MovieRankListView()
       );
  }
}

