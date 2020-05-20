import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_flutter_app/data/api/api_client.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/res/colors.dart';
import 'package:good_flutter_app/ui/widget/index.dart';

/// 电影列表页面 （豆瓣热门，正在热映，即将上映）
///
///
class MovieListPage extends StatefulWidget {

  final String title;
  final String action;

  const MovieListPage({Key key, this.title, this.action}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState(title, action);
}

class _MovieListPageState extends State<MovieListPage> {

  String title;
  String action;
  List<MovieItem> movieList;

  // 默认加载 20 条数据
  int start = 0, count = 20;

  bool _loaded = false;

  ScrollController _scrollController = ScrollController(); //listview的控制器

  _MovieListPageState(this.title, this.action);

  @override
  void initState() {
    super.initState();
    fetchData();
    // 滚动监听注册
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print('滑动到了最底部');
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//          brightness: Brightness.light,
          title: Text(title, style: TextStyle(color: AppColor.black)),
          backgroundColor: AppColor.white,
          leading: GestureDetector(
            onTap: (){ Navigator.pop(context); },
            child: Icon(Icons.arrow_back, color: AppColor.black),
          ),
          elevation: 0,
        ),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    if (movieList == null) {
      return Center(
        child: CupertinoActivityIndicator(
        ),
      );
    }
    return Container(
      child: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index+1 == movieList.length) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Offstage(
                  offstage: _loaded,
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
          }
          return  MovieListItem(movieList[index], action);
        },
        controller: _scrollController,
      ),
    );
  }


  Future<void> fetchData() async {
    if (_loaded) {
      return;
    }
    ApiClient client = new ApiClient();
    var data;
    switch (action) {
      case 'in_theaters':
        data = await client.getNowPlayingList(start: start, count: count);
        break;
      case 'coming_soon':
        data = await client.getComingList(start: start, count: count);
        break;
      case 'search':
        data = await client.getSearchListByTag(tag: title, start: start, count: count);
        break;
    }
    setState(() {
      if (movieList == null) {
        movieList = [];
      }
      List<MovieItem> newMovies = data;
      if (newMovies.length == 0) {
        _loaded = true;
        return;
      }
      newMovies.forEach((movie) {
        movieList.add(movie);
      });

      start = start + count;
    });
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}