
class Cinema {
  String id;
	String name;
	String address;
	String distance;
	bool refund;
	bool endorse;
	bool vip;
	bool snack;

  Cinema.fromJson(Map data) {
    id = data['id'];
    name = data['name'];
    address = data['address'];
    distance = data['distance'];
    refund = data['refund'] != null ? data['refund'] : false;
    endorse = data['endorse'] != null ? data['endorse'] : false;
    vip = data['vip']!= null ? data['vip'] : false;
    snack = data['snack']!= null ? data['snack'] : false;
  }
}
