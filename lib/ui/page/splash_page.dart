import 'package:base_library/base_library.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:good_flutter_app/common/config.dart';
import 'package:good_flutter_app/router/index.dart';
import 'package:good_flutter_app/ui/widget/swiper.dart';

/// 闪屏页
/// 广告页(默认页) 或者 引导页
///
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;
  List<String> _guideList;
  List<Widget> _guideViewList = new List();

  int _status = 0; // 0, 闪频页 1 引导页
  int _count = 3;

  SplashModel _splashModel;
  var isNewVersion = false; // 是否是新版本，是则显示引导页

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: _status != 0,
            child: _buildSplashView(),
          ),
          new Offstage(
            offstage: _status != 1,
            child: _buildGuideView(),
          ),
        ],
      ),
    );
  }


  void _init() {
    _loadSplashData();

    int versionCode = SpUtil.getInt("app.version_code");
//    String versionName = SpUtil.getString("app.version_name");

    int newVersionCode = Config.versionCode; // 此处要注意 代码中和打包的versionCode是否一致
    if (newVersionCode > versionCode) {
      print("find New Version: " + Config.versionName);
      isNewVersion = true;
      SpUtil.putString("app.version_name", Config.versionName);
      SpUtil.putInt("app.version_code", newVersionCode);
      _guideList = [ "assets/image/guide_1.png", "assets/image/guide_2.png", "assets/image/guide_3.png"];
      _initGuideViews();
    } //  获取本地存储的版本 和 当前版本 比较

    // 计时3秒自动跳转首页
    _startCountDown();
  }

  void _loadSplashData() {

    // TODO 获取广告图片
    _splashModel = SplashModel(
        title:"Edgar Deng",
        url:"https://edgardeng.github.io",
        img: "https://*");
//    _splashModel = SplashModel(
//        title:"站酷",
//        url:"https://www.zcool.com.cn/work/ZMjQwNTQ3NTI=.html",
//        img: "https://img.zcool.cn/community/01e9b459c884e3a8012053f8d1eaaa.png");

//    _splashModel = SpUtil.getObj(
//        Constant.key_splash_model, (v) => SplashModel.fromJson(v));
//    if (_splashModel != null) {
//      setState(() {});
//    }
//    HttpUtils httpUtil = new HttpUtils();
//    httpUtil.getSplash().then((model) {
//      if (!ObjectUtil.isEmpty(model.imgUrl)) {
//        if (_splashModel == null || (_splashModel.imgUrl != model.imgUrl)) {
//          SpUtil.putObject(Constant.key_splash_model, model);
//          setState(() {
//            _splashModel = model;
//          });
//        }
//      } else {
//        SpUtil.putObject(Constant.key_splash_model, null);
//      }
//    });
  }

  /// 引导页列表
  void _initGuideViews() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length - 1) {
        _guideViewList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 160.0),
                child: new InkWell(
                  onTap: () {
                    _goMain();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40, top: 40),
                    //设置 child 居中
                    alignment: Alignment(0, 0),
                    height: 50,
                    width: 300,
                    //边框设置
                    decoration: new BoxDecoration(
                      //背景
                      color: Colors.green,
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //设置四周边框
//                      border: new Border.all(width: 1, color: Colors.red),
                    ),
                    child: Text("立即体验", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ),
              ),
            ),
          ],
        ));
      } else {
        _guideViewList.add(new Image.asset(
          _guideList[i],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
      }
    }
  }

  // 启动倒计时
  void _startCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      print("_timerUtil:" + tick.toString());
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt(); // 显示倒计时间
      });
      if (_tick == 0) {
        // 时间到
        if (isNewVersion) {
          setState(() {
            _status = 1; // 显示引导页
          });
        } else {
          RouterHelper.replace(context, "/main");
        }
      }
    });
    _timerUtil.startCountDown();
  }

  Widget _defaultAdImageView() {
    return Image.asset(
      "assets/image/splash_bg.png",
      width: Screen.width,
      fit: BoxFit.fill,
      height: Screen.height,
    );
  }

  /// 闪屏页
  Widget _buildSplashView() {
    // 上面图片，下面版本号
    return
      Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: InkWell(
              onTap: () {
                _goMain();
                RouterHelper.pushWeb(context, _splashModel.title, _splashModel.url);
              },
          child:new Container(
              alignment: Alignment.center,
              child: new CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                imageUrl: _splashModel?.img,
                placeholder: (context, url) => _defaultAdImageView(),
                errorWidget: (context, url, error) => _defaultAdImageView(),
              )))
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Screen.width,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(Config.appName,style: TextStyle(fontSize: 24, color: Colors.green),),
                    Gaps.hGap15,
                    Text(Config.versionName)
                  ],
                ),
              )
            ),
          ),
          Positioned(
            top: 40,
            right: 15,
            child: new Text(_count.toString() + "s",
              style: new TextStyle(fontSize: 16, color: Colors.deepOrange)
            ),
    )
        ],
      );
  }

  /// 引导页
  Widget _buildGuideView() {
    if (ObjectUtil.isEmpty(_guideViewList)) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: RoundButton(
              text:'立即体验',
              onPressed: (){
                _goMain();
              }
          )
        )
      );
    } else {
      return new Swiper(
          autoStart: false,
          circular: false,
          indicator: CircleSwiperIndicator(
            radius: 4.0,
            padding: EdgeInsets.only(bottom: 30.0),
            itemActiveColor: Colors.green,
            itemColor: Colors.grey,
          ),
          children: _guideViewList
      );
    }
  }

  void _goMain() {
    RouterHelper.replace(context, "/home");
  }


  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得在dispose里面把timer cancel。
  }
}

class SplashModel {
  String title;
  String url;
  String img;

  SplashModel({this.title, this.url, this.img});

  SplashModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        img = json['img'];
  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
    'img': img,
  };
  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"img\":\"$img\"");
    sb.write('}');
    return sb.toString();
  }
}
