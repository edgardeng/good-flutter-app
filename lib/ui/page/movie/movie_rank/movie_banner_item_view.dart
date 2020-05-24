import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/res/colors.dart';
import 'package:good_flutter_app/router/index.dart';
import 'package:good_flutter_app/ui/widget/index.dart';

/// 排行榜 banner
///
///
class RankBannerItemView extends StatelessWidget {
//  List<MovieItem> movies;
  final String title;
  final String subTitle;
  final List<Color> gradientColors;
  final String action;

  RankBannerItemView(this.title, this.subTitle, this.action,this.gradientColors);

//  BoxDecoration _bannerBg() {
//    if (movies == null || movies.length < 1) {
//      return BoxDecoration(
//          color: AppColor.halfDarkGrey,
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(5), topRight: Radius.circular(5)));
//    }
//    return BoxDecoration(
//        image: DecorationImage(
//          image: CachedNetworkImageProvider(movies[0].images.medium),
//          fit: BoxFit.cover,
//        ),
//        borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(5), topRight: Radius.circular(5)));
//  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: GestureDetector(
        onTap: () {
          String path =
              "/movie?title=${Uri.encodeComponent(title)}&action=${Uri.encodeComponent(action)}";
          RouterHelper.push(context, path);
        },
        child: Container(
            width: Screen.width,
            child: Column(
              children: <Widget>[
                Container(
                  width: Screen.width,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
//              border: new Border.all(color: Color(0xFFFFFF00), width: 0.5), // 边色与边宽度
//            gradient: RadialGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)],radius: 1, tileMode: TileMode.mirror) // 环形渲染
//        gradient: SweepGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)], startAngle: 0.0, endAngle: 1*3.14) //扫描式渐变
                      gradient: LinearGradient(
                          colors: gradientColors != null ? gradientColors : [Color(0xFFffffff), Color(0xFF9950e8)],
                          begin: FractionalOffset(1, 0),
                          end: FractionalOffset(0, 1)) // 线性渐变
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          subTitle,
                          style: TextStyle(color: AppColor.white),
                        ),
                        Text(title,
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            )),
      )
    );
  }

//  Widget _buildRankList() {
//    if (movies == null || movies.length < 1) {
//      return Container(
//          child: Center(
//        child: CircularProgressIndicator(),
//      ));
//    }
//    return Container(
//        child: ListView.builder(
//      itemCount: 5,
//      itemBuilder: (BuildContext context, int index) {
//        return buildRank(context, index);
//      },
//    ));
//  }

//  Widget buildRank(BuildContext context, int rank) {
//    return Padding(
//      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text(
//            '${rank + 1}. ${movies[rank].title}',
//            style: TextStyle(color: AppColor.grey),
//            maxLines: 1,
//            overflow: TextOverflow.ellipsis,
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              new StaticRatingBar(
//                size: 10.0,
//                rate: movies[rank].rating.average / 2,
//              ),
//              SizedBox(
//                width: 10,
//              ),
//              Text(
//                '${movies[rank].rating.average}',
//                style: TextStyle(color: AppColor.white),
//              )
//            ],
//          )
//        ],
//      ),
//    );
//  }

}
