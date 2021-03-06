import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_flutter_app/ui/widget/movie_classify_section_view.dart';

class MovieClassifyListView extends StatefulWidget {


  @override
  _MovieClassifyListViewState createState() => _MovieClassifyListViewState();
}

class _MovieClassifyListViewState extends State<MovieClassifyListView> {



  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text('分类找电影'),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: back,
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              MovieClassifySectionView('类型'),
              MovieClassifySectionView('地区'),
              MovieClassifySectionView('特色'),
            ],
          ),
        )
      );
  }

  back() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}