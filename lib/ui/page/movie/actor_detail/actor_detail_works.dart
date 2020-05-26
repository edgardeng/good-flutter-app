import 'package:flutter/material.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/ui/widget/index.dart';
import 'package:good_flutter_app/util/utility.dart';

// 演员相关影视
class ActorDetailWorks extends StatelessWidget {
  
  final List<MovieActorWork> works;

  const ActorDetailWorks(this.works);


  @override
  Widget build(BuildContext context) {

    return Container(
      // padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('影视作品',
              style: TextStyle(
                fontSize: fixedFontSize(16),
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
          ),
          SizedBox(height: 20,),
          SizedBox.fromSize(
            size: Size.fromHeight(180),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: works.length,
              itemBuilder: (BuildContext context, int index) {
              return _buildWorks(context, index);
             },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWorks(BuildContext context, int index) {
    double width = 90;
    MovieActorWork work  =works[index];
    double paddingRight = 0;
    if (index ==works.length-1) {
      paddingRight = 15;
    }
    return  GestureDetector(
      onTap: () {
//        AppNavigator.pushMovieDetail(context, work.movie);
      },
      child: Container(
        margin: EdgeInsets.only(left: 15,right: paddingRight),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieCoverImage(work.movie.images.small, width: width, height: width / 0.75,),
            SizedBox(height: 5,),
            Text(
              work.movie.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.white),
              maxLines: 1,
            ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new StaticRatingBar(size: 12.0,rate: work.movie.rating.average/2,),
                SizedBox(width: 5,),  
                Text(work.movie.rating.average.toString(),style: TextStyle(color: Colors.white, fontSize: 12.0),)
              ],
            ),
          ],
        ),
      ),
    );
  }

}
