import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage({@required this.url, this.title});
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  void deactivate() {
    print('webview deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);
    print('webview dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: back,
          child: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
//              Share.share(this.widget.url);
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(Icons.share),
              )),
        ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: this.widget.url,
          javascriptMode: JavascriptMode.unrestricted,
//          onWebViewCreated: (WebViewController webViewController) {
//            _controller.complete(webViewController);
//          },
          // TODO(iskakaushik): Remove this when collection literals makes it to stable.
          // ignore: prefer_collection_literals
//          javascriptChannels: <JavascriptChannel>[
//            _toasterJavascriptChannel(context),
//          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          //      withZoom: true,
//      withLocalStorage: true,
//      hidden: true,
//      initialChild: Container(
//        child: const Center(
//          child: CupertinoActivityIndicator()
//        ),
//      ),
        );
      }),
    );
  }
   // 返回上个页面
  back() {
    Navigator.pop(context);
  }
}