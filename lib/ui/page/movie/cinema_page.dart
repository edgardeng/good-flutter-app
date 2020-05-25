import 'package:flutter/material.dart';
import 'package:good_flutter_app/data/api/api_client.dart';
import 'package:good_flutter_app/model/index.dart';
import 'package:good_flutter_app/router/index.dart';
import 'package:good_flutter_app/ui/page/movie/cinema/cinema_item_view.dart';
import 'package:location/location.dart';

/// Cinema Page UI
///
class CinemaPage extends StatefulWidget {

  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> with AutomaticKeepAliveClientMixin {

  String city = "上海";
  List<Cinema> cinemaList = [];

  @override
  void initState() {
    super.initState();
    print('CinemaPage init');
    getLocation();
    _fetchData();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            RouterHelper.push(context, "/city_select").then( (result) {
                 setState(() {
                   print("return city: $result");
                   city = result.name;
                 });
              }
            );
          },
          child: Row(
              children: <Widget>[
                Text(city),
                Icon(Icons.expand_more)
              ],
            ),
        ),
        title: Text('影院'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
//            onPressed:() => showSearch(context:context, delegate: SearchBarDelegate()),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: cinemaList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return CinemaItemView(item);
              });
        }).toList()
        )
      ),
    );
  }

  void getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      print("location is not Enabled");
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("location request not Enabled");
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      print("location permission denied");
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("location permission not granted");
        return;
      }
    }
    print("location get ... ");
    _locationData = await location.getLocation();
    print("latitude: "+ _locationData.latitude.toString() + ", latitude: "+_locationData.longitude.toString());

  }

  /// 获取列表
  Future<void> _fetchData() async {
    ApiClient client = new ApiClient();
    var data = await client.getCinemas(0,0,'310100');
    setState(() {
      cinemaList = data;
    });
  }

}