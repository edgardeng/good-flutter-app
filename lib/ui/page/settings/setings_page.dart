import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isDarkMode = false;

  @override
  void deactivate() {
    print('Settings deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('Settings dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        leading: GestureDetector(
          onTap: back,
          child: Icon(Icons.arrow_back),
        ),
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return Column (
          children: <Widget>[
            ListTile(
//              leading: new Icon(Icons.cake),
              title: new Text('深色模式'),
//              subtitle: new Row(
//                children: <Widget>[
//                  new Text('副标题'),
//                  new Icon(Icons.person)
//                ],
//              ),
              trailing: Switch(
                value: isDarkMode,
                activeColor: Colors.blue,     // 激活时原点颜色
                onChanged: (bool val) {
                  this.setState(() {
                    this.isDarkMode = !this.isDarkMode;
                  });
                },
              )
            )
          ],
        );
      }),
    );
  }
  // 返回上个页面
  back() {
    Navigator.pop(context);
  }
}