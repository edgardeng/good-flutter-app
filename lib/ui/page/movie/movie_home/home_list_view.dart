import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_flutter_app/data/api/api_client.dart';

import 'movie_three_grid_view.dart';
import 'home_news_banner_view.dart';


class HomeListView extends StatefulWidget {

  HomeListView();

  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> with AutomaticKeepAliveClientMixin {
  
  int pageIndex = 0;
  var newsList;
  var nowPlayingList, comingList;

  @override
  void initState() { 
    super.initState();
    fetchData();
  }
  
  @override
  Widget build(BuildContext context) {

    if (nowPlayingList == null) {
      return new Center(
        child: new CupertinoActivityIndicator(
        ),
      );
    } else {  
        return Container(
        child: RefreshIndicator(
//          color: AppColor.primary,
          onRefresh: fetchData,
          child: ListView(
              addAutomaticKeepAlives: true,
              // 防止 children 被重绘，
              cacheExtent: 10000,
              children: <Widget>[
//                new NewsBannerView(newsList),
                new MovieThreeGridView(nowPlayingList, '影院热映', 'in_theaters'),
                new MovieThreeGridView(comingList, '即将上映', 'coming_soon'),
//                new MovieTopScrollView(title: '电影榜单'),
                // new MovieClassifyView(title: '分类浏览')
              ],
          ),
        )
      );
    }
    
  }

  // 加载数据
  Future<void> fetchData() async {
    print(" home list view fetchData ...");
    // 正在热映


    /// TODO fetchData
      ApiClient client = new ApiClient();
//      List<MovieNews> news = await client.getNewsList();
      var nowPlayingData = await client.getNowPlayingList(start: 0, count: 6);
      var comingListData = await client.getComingList(start: 0, count: 6);

      setState(() {
//        newsList =news2Banner(news);
        comingList =  comingListData;
        nowPlayingList = nowPlayingData;
        // classifyMovieList = classifyMovies;
        // classifyMovieTags = tags;
      });
  }

  List<NewsBanner> news2Banner(var list) {
    List content = list;
    List<NewsBanner> banners = [];
    content.forEach((data) {
      banners.add(new NewsBanner(data));
    });
    return banners;
  }

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;
}