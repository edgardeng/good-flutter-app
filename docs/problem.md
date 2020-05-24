
## Flutter 

### Invalid argument(s): Illegal percent encoding in URI
> 页面间传递中文需要用Uri.encodeComponent转换，否则就报Invalid argument(s): Illegal percent encoding in URI异常,
  ```
  NavigatorUtils.push(context, '${PersonInfoRouter.modifyUserNamePage}?title=${Uri.encodeComponent("修改用户名")}&username=${Uri.encodeComponent(userName)}');
  ```
2、TextField的内容离底部横线距离太高，只需要用TextField->decoration(InputDecoration)->contentPadding设置一下就可以，
  例如：
  TextField(
  decoration: InputDecoration(
  contentPadding: EdgeInsets.all(0.0),
  ),
  
3、错误setState() or markNeedsBuild() called during build.一般是方法传递错误，修改成这样然后点击事件在方法内部判断就可以了
  
  
本文会持续更新...凡是遇到的问题，都会顺序整理进去。

1.Scaffold.of() called with a context that does not contain a Scaffold.
当你在 dart 文件中要使用 SnackBar 时，需要调用 BuildContext 参数，但是你经常会遇到 在使用的时候报上边的错
为什么会出现这个问题呢？很多时候是因为你传递的 BuildContext 不是 Scaffold 的，而是当前parent widget 的，所以会有这个问题。那么该怎么解决这个问题呢？目前我发现两种方案：
option1：
使用 Builder 包裹

option2：
给Scaffold 设置一个全局 key，通过 key 的如下方法来显示

var _scaffoldkey = new GlobalKey<ScaffoldState>();
Scaffold(
    key: _scaffoldkey,
    body: SafeArea(
        child: _buildContent(),
        ),
)
// 显示 SnackBar 的方法
void showSnackBar(String text) {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text(text),
        backgroundColor: Colors.blueAccent,
    ));
}
2.如何获取 Widget 的宽高尺寸呢？
可以使用 context.size.height context.size.width 分别获取 Widget 的宽高尺寸

3.弹出软键盘的时候，在 IOS 平台上遇到无法关闭键盘
有的 IOS 机型上，会遇到这个问题，软键盘调起来了，无法关闭软键盘，那么该怎么处理呢？很简单，其实只需要一行代码就行了: 在你的布局外层，嵌套一层点击，去获取焦点就行了

在布局外层包裹一层点击事件
 InkWell(
        onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
        },
        child: child
     )
4.Android 嵌套Flutter 后退键返回上一级页面处理
在我们的项目中，参考了 AirBnb 的架构模式，所以只是将 main.dart 文件作为了一个 Flutter 页面的入口，通过 pushName()的方式实现 Flutter 页面的各种调转，包括 Flutter 本身的二级页面跳转，但是在开发这个Flutter-to-Flutter 的页面跳转中，遇到了一个问题：进入第二级页面，然后在 Android 真机上点击系统返回键，竟然直接 彻底退出了，啥叫彻底退出呢？就是二级页面&一级页面都销毁了，，Flutter 所绑定的Activity 也销毁了。。通过源码断点各种跟踪发现，原来是直接调用了 onBackPressd()方法了，所以就有了下边的代码来解决这个问题。。

    override fun onBackPressed() {
        if (flutterView != null) {
            flutterView?.popRoute()
        } else {
            super.onBackPressed()
        }
    }
5.route打开新页面黑屏问题
在 FlutterView 创建的时候，加上如下代码即可：

flutterView.enableTransparentBackground()
6.If you're running an application and need to access the binary messenger before runApp() has been called...
当前Flutter版本 1.10.2
升级到新版本之后，因为之前在 main() 方法中有异步操作，对一些插件做了初始化操作，所以在最新版本中会出现如下报错：

Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized.
    If you're running an application and need to access the binary messenger before `runApp()` has been called (for example, during plugin initialization), then you need to explicitly call the `WidgetsFlutterBinding.ensureInitialized()` first.
    If you're running a test, you can call the `TestWidgetsFlutterBinding.ensureInitialized()` as the first line in your test's `main()` method to initialize the binding.
    #0      defaultBinaryMessenger.<anonymous closure> (package:flutter/src/services/binary_messenger.dart:73:7)
    #1      defaultBinaryMessenger (package:flutter/src/services/binary_messenger.dart:86:4)
    #2      MethodChannel.binaryMessenger (package:flutter/src/services/platform_channel.dart:140:62)
    #3      MethodChannel.invokeMethod (package:flutter/src/services/platform_channel.dart:314:35)
    <asynchronous suspension>
    #4      FlutterCrashlytics.initialize (package:flutter_crashlytics/flutter_crashlytics.dart:18:53)
解决办法是在 runApp 之前，调用 WidgetsFlutterBinding.ensureInitialized(); 即可解决
注意：如果你不是放在了 main() 方法里边的第一行，而且还发现无效，那么尝试把他放到 main() 里边的第一行再试试，应该会 OK
https://groups.google.com/forum/#!msg/flutter-announce/sHAL2fBtJ1Y/mGjrKH3dEwAJ

https://github.com/flutter/flutter/pull/38464

7.Waiting for another flutter command to release the startup lock...
很多时候你运行 flutter *** 命令的时候，可能会遇到这个提示信息，比如你的 Android Studio 或者 XCode 正在 run, 然后你又去运行 flutter 相关的命令的时候，一定会出现这个，解决办法就是删除一个 lockfile 文件就行了。该文件的目录是：

<YOUR FLUTTER FOLDER>/bin/cache/lockfile
8.RenderBox was not laid out: RenderRepaintBoundary#4bb81 relayoutBoundary=up5 NEEDS-PAINT
原因：在Flutter 的Column或者Row内使用ListView.builder()需要对改ListView的大小进行指定.
解决：具体的解决办法就是 在该ListView.builder()外嵌套一个SizeBox或者Container即可…


Execution failed for task ':app:checkDebugDuplicateClasses'.
Duplicate class android.support.v4.app.INotificationSideChannel found in modules core-1.1.0-runtime.

冰糖葫芦三剑客 2020-03-28 10:56:11  190  收藏
展开
1.错误如下：

Duplicate class android.support.v4.app.INotificationSideChannel found in modules core-1.1.0-runtime.jar (androidx.core:core:1.1.0) and support-compat-26.1.0-runtime.jar (com.android.support:support-compat:26.1.0)

2.解决方法：

在gradle.properties中添加以下内容

android.useAndroidX=true
android.enableJetifier=true

