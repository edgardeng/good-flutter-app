import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:async';
import 'package:good_flutter_app/model/index.dart';
import 'package:flutter/services.dart';


class ApiClient {
  static const String baseUrl = 'https://douban.uieee.com/v2/movie/';

//  static const String apiKey = '0b2bdeda43b5688921839c8ecb20399b';
  static const String webUrl = 'https://movie.douban.com/';
  var dio = ApiClient.createDio();

  // 获取首页热门新闻文章
//  Future<List<MovieNews>> getNewsList() async{
//
//    List<MovieNews> news = [];
//
//    await http.get(webUrl).then((http.Response response){
//      var document = parse(response.body.toString());
//      List<dom.Element> items = document.getElementsByClassName('gallery-frame');
//      items.forEach((item) {
//        String cover = item.getElementsByTagName('img')[0].attributes['src'].toString();
//        String link = item.getElementsByTagName('a')[0].attributes['href'].toString();
//        String title = item.getElementsByTagName('h3')[0].text.toString().trim();
//        String summary =item.getElementsByTagName('p')[0].text.toString().trim();
//        MovieNews movieNews = new MovieNews(title, cover, summary, link);
//        news.add(movieNews);
//      });
//    });
//    return news;
//  }

  // 获取正在上映电影
  Future<List<MovieItem>> getNowPlayingList({int start, int count}) async {
    Response<Map> response = await dio.get('in_theaters', queryParameters: {"start":start, 'count':count});
    var subs = response.data['subjects'];
    return getMovieList(subs);
  }

  // 获取即将上映电影
  Future<List<MovieItem>> getComingList({int start, int count}) async {
    Response<Map> response = await dio.get('coming_soon', queryParameters: {"start":start, 'count':count});
    return getMovieList(response.data['subjects']);
  }

  // map list convert  List<MovieItem>
  List<MovieItem> getMovieList(var list) {
    List content = list;
    List<MovieItem> movies = [];
    content.forEach((data) {
      movies.add(MovieItem.fromJson(data));
    });
    return movies;
  }

  List<MovieItem> getRankMovieList(var list) {
    List content = list;
    List<MovieItem> movies = [];
    content.forEach((data) {
      movies.add(MovieItem.fromJson(data["subject"]));
    });
    return movies;
  }

  Future<Map> get(String path,  {Map<String, dynamic> params}) async {
    print(" --- DIO --- ");
    print("GET: " + baseUrl + "/" + path);
    Response<Map> response = await dio.get(path, queryParameters: params);
//    print("Response: " + response.data.toString());
    return response.data;
  }


  // 获取本周口碑榜电影
  Future<dynamic> getWeeklyList() async {
    Map<String, dynamic> data = await get('weekly');
    return getRankMovieList(data['subjects']);
  }
  // 获取新片榜电影
  Future<dynamic> getNewMoviesList() async {
    Map<String, dynamic> data = await get('new_movies');
    return getMovieList(data['subjects']);
  }

  // 获取北美票房榜电影
  Future<dynamic> getUsBoxList() async {
    Map<String, dynamic> data = await get('us_box');
    return getRankMovieList(data['subjects']);
  }

  // 获取 top250 榜单
  Future<dynamic> getTop250List({int start, int count}) async {
    Map<String, dynamic> data = await get('top250', params: {'start':start, 'count':count});
    return getMovieList(data['subjects']);
  }

  // 根据标签搜索
  Future<dynamic> getSearchListByTag({String tag, int start, int count}) async {
    Response<Map> response = await dio.get('search', queryParameters: {'tag':tag, 'start':start, 'count':count});
    return response.data['subjects'];
  }

  // 根据关键字搜索
  Future<dynamic> getSearchListByKey({String key, int start, int count}) async {
    Response<Map> response = await dio.get('search', queryParameters: {'q':key, 'start':start, 'count':count});
    return response.data['subjects'];
  }

  // 获取电影详情
  Future<MovieDetail> getMovieDetail(String movieId) async {
    Response<Map> response = await dio.get('subject/$movieId');
    return MovieDetail.fromJson(response.data);
  }

  // 影片剧照
  Future<dynamic> getMovieAlbum({String movieId, int start, int count}) async {
    Response<Map> response = await dio.get('subject/$movieId/photos', queryParameters: {'start':start, 'count':count});
    return
    getPhotoList(response.data['photos']);
  }

  // 演员详细信息
  Future<dynamic> getActorDetail(String actorId) async {
    Response<Map> response = await dio.get('celebrity/$actorId');
    return MovieActorDetail.fromJson(response.data);
  }


  // 获取演员相册
  Future<dynamic> getActorPhotos({String actorId, int start, int count}) async {
    Response<Map> response = await dio.get('celebrity/$actorId/photos', queryParameters: {'start':start, 'count':count});
    return
    getPhotoList(response.data['photos']);
  }

  List<MoviePhoto> getPhotoList(var list) {
    List content = list;
    List<MoviePhoto> photos = [];
    content.forEach((data) {
      photos.add(MoviePhoto.fromJson(data));
    });
    return photos;
  }

  // 获取影院
  Future<dynamic> getCinemas(double lat, double lon, String cityCode) async {
    String value = await rootBundle.loadString('assets/data/cinemas.json');
    List list = json.decode(value);
    List<Cinema> photos = [];
    list.forEach((data) {
      photos.add(Cinema.fromJson(data));
    });
    return photos;
  }


  static Dio createDio() {
    var options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 1000 * 10,
        receiveTimeout: 1000 * 30,
        contentType: Headers.jsonContentType,
        queryParameters: {
//          "apikey":apiKey
        }
    );
    return Dio(options);
  }

}