import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/data/api/api_client.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/res/colors.dart';
import 'package:good_flutter_app/ui/page/movie/movie_rank/movie_banner_item_view.dart';

class MovieRankListView extends StatefulWidget {
  final String title;
  const MovieRankListView({Key key, this.title}) : super(key: key);
  @override
  _MovieRankListViewState createState() => _MovieRankListViewState();
}

class _MovieRankListViewState extends State<MovieRankListView> with AutomaticKeepAliveClientMixin<MovieRankListView>{

//  var weeklyList,
//      top250List,
//      usBoxList,
//      newMovieList;
//  List<MovieRankBanner> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RankBannerItemView('一周口碑电影榜', '每周五更新·共10部', 'weekly',
              [Color(0xFF90fee5), Color(0xFF5bc1ef), Color(0xFF775ead)]),
          RankBannerItemView('豆瓣电影Top250', '豆瓣榜单·共250部', 'top250',
              [Color(0xFF8efc98), Color(0xFF6bd6fa)]),
          RankBannerItemView('一周新电影榜', '每周五更新·共10部', 'new_movies',
              [Color(0xFFf7cac9),Color(0xFF92a8d1),Color(0xFF6e98e7)]),
          RankBannerItemView('北美电影票房榜', '每周五更新·共10部', 'us_box', null),
        ]);
  }

  @override
  void initState() {
    super.initState();
//    fetchData();
  }

  // 加载数据
  Future<void> fetchData() async {
      ApiClient client = new ApiClient();

      var weeklyData =  await client.getWeeklyList();
      var top250Data = await client.getTop250List(start: 0, count: 10);
      var usBoxData =  await client.getUsBoxList();
      var newMovieData = await client.getNewMoviesList();

//      PaletteGenerator paletteGenerator1 = await PaletteGenerator.fromImageProvider(
//        CachedNetworkImageProvider(weeklyData[0].images.small));
//      PaletteGenerator paletteGenerator2 = await PaletteGenerator.fromImageProvider(
//        CachedNetworkImageProvider(top250Data[0].images.small));
//      PaletteGenerator paletteGenerator3 = await PaletteGenerator.fromImageProvider(
//        CachedNetworkImageProvider(newMovieData[0].images.small));
//      PaletteGenerator paletteGenerator4 = await PaletteGenerator.fromImageProvider(
//        CachedNetworkImageProvider(usBoxData[0].images.small));

    setState(() {
//        weeklyList = weeklyData;
//        top250List = top250Data;
//        usBoxList = usBoxData;
//        newMovieList = newMovieData; // 更新数据
//      banners = [
//        new MovieRankBanner(weeklyList, '一周口碑电影榜', '每周五更新·共10部', 'weekly', AppColor.darkGrey), // paletteGenerator1.darkVibrantColor),
//        new MovieRankBanner(top250List, '豆瓣电影Top250', '豆瓣榜单·共250部', 'top250',AppColor.darkGrey),
//        new MovieRankBanner(newMovieList, '一周新电影榜', '每周五更新·共10部', 'new_movies',AppColor.darkGrey),
//        new MovieRankBanner(usBoxList, '北美电影票房榜', '每周五更新·共10部', 'us_box', AppColor.darkGrey)
//      ];
    });
  }


  @override
  bool get wantKeepAlive => true;

//  Widget _buildBannerView(BuildContext context) {
//
//    if (banners == null) {
//      return Container(
//        padding: EdgeInsets.symmetric(horizontal: 5),
//        decoration: BoxDecoration(
//            color: Color(0xff3E454D),
//            borderRadius: BorderRadius.all(Radius.circular(5))
//        ),
//        width: Screen.width,
//        height: Screen.width*9/15,
//      );
//    }
//
//    return Container(
//      color: Colors.white,
//      child: Column(
//          children: banners.map((banner) {
//            return Builder(
//              builder: (BuildContext context) {
//                return GestureDetector(
//                  onTap: () {
////                  AppNavigator.pushMovieTopList(context, banner.title, banner.subTitle, banner.action,);
//                  },
//                  child: Container(
//                      width: Screen.width,
//                      margin: EdgeInsets.symmetric(horizontal: 5.0),
//                      child: RankBannerItemView(banner.movies, banner.title, banner.subTitle, banner.coverColor)
//                  ),
//                );
//              },
//            );
//          }).toList()
////        options: CarouselOptions(aspectRatio: 15 / 9)
//      ),
//    );
//  }
}

//class MovieRankBanner {
//  List<MovieItem> movies;
//  String title;
//  String subTitle;
//  String action;
//  Color coverColor;
//  MovieRankBanner(this.movies, this.title, this.subTitle, this.action, this.coverColor);
//}
