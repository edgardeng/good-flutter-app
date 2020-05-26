class User {
  String token;
  String username;
  String id;
  String avatarUrl;
  int expiredAt;
  //  String nickname;
  //  bool isVip;
  //  double wealth;
  //  int coupon;
  //  int monthlyTicket;

  User.fromJson(Map json) {
    token = json['token'];
    id = json['id'];
    username = json['username'];
    avatarUrl = json['avatar'];
//    isVip = json['is_vip'] == 1;
//    wealth = json['wealth'];
//    coupon = json['coupon'];
//    monthlyTicket = json['ticket'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'username': username,
      'avatar': avatarUrl
    };
  }
}
