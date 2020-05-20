import 'package:base_library/base_library.dart';
import 'package:good_flutter_app/model/movie_detail.dart';

class MovieRepository {

//  Future<List<MovieDetail>> getMovieListInthe(int page) async {
//
//    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
//        .request<Map<String, dynamic>>(
//        Method.get,
//        ApiLocation.getPath(path: ApiLocation.lg_collect_list, page: page));
//    if (baseResp.code != Constant.status_success) {
//      return new Future.error(baseResp.msg);
//    }
//    List<ReposModel> list;
//    if (baseResp.data != null) {
//      ComData comData = ComData.fromJson(baseResp.data);
//      list = comData.datas?.map((value) {
//        ReposModel model = ReposModel.fromJson(value);
//        model.collect = true;
//        return model;
//      })?.toList();
//    }
//    return list;
//  }

}