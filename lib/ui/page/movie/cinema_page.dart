import 'package:flutter/material.dart';
import 'package:location/location.dart';

/// Cinema Page UI
class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print('CinemaPage init');
    getLocation();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    var appModel = AppModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CinemaPage')
      ),
      body: Container(
        child: Text('CinemaPage ')
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
    print("latitude: "+ _locationData.latitude.toString() + "latitude: "+_locationData.longitude.toString());

  }
}