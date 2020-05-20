
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
  
  
  图1
