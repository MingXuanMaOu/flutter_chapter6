
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chapter6/errorpage.dart';

class Application{
  static FluroRouter? router;
}

abstract class IRouterProvider{
  void initRouter(FluroRouter router);
}

class MyRouter implements IRouterProvider{
  static String page2 = "/homepage/page2";
  static String page3 = "/homepage/page3";

  void initRouter(FluroRouter router){
    router.define(page2, handler: Handler(handlerFunc: (_,params) => Page2()));
    router.define(page3, handler: Handler(handlerFunc: (_,params) => Page3()));

  }
}

class Routes {
  static String home = "/homePage";
  static String onePage = "/homePage/page1";

  static List<IRouterProvider> _listRouters = [];
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          debugPrint("ROUTE NOT FOUND!!");
          return ErrorPage();
        });
    router.define(home, handler: Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params) => HomePage()));
    router.define(onePage, handler: Handler(handlerFunc: (_,params){
      String title = "123";
      return Page1(title: title,);
    }));

    _listRouters.clear();
    _listRouters.add(MyRouter());
    _listRouters.forEach((element) {
      element.initRouter(router);
    });
  }
}

class NavigatorUtils {
  static push(BuildContext context,String path,{bool replace = false,bool clearStack = false}){
    FocusScope.of(context).requestFocus(new FocusNode());
    Application.router?.navigateTo(context, path,replace: replace,clearStack: clearStack,transition: TransitionType.native);
  }

  static pushResult(BuildContext context,String path,Function(Object) function,{bool replace = false,bool clearStack = false}){
    Application.router?.navigateTo(context, path,replace: replace,clearStack: clearStack,transition: TransitionType.native).then((value) => {
      function(value)
    });
  }

  static void goOnePage(BuildContext context,String title){
    push(context,'${Routes.onePage}?title=${Uri.encodeComponent(title)}');
  }

  static void goBack(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    Navigator.pop(context);
  }

  static void goBackWithParams(BuildContext context,result){
    FocusScope.of(context).requestFocus(new FocusNode());
    Navigator.pop(context,result);
  }
}



class HomePage extends StatelessWidget {
  String content = "我是第一个页面";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我的主页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('我的主页',style: TextStyle(fontSize: 32),),
            OutlinedButton(onPressed: () {
              NavigatorUtils.goOnePage(context,content);
            }, child: Text('跳转界面'))
          ],
        ),
      ),
    );
  }
}
class Page1 extends StatefulWidget{
  Page1({ required this.title});

  final String title;
  @override
  State<StatefulWidget> createState() {
    return _Page1State();
  }
}

class _Page1State extends State<Page1>{
  late String textStr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(fontSize: 32),
            ),
            OutlinedButton(
              child: Text('跳转界面'),
              onPressed: (){
                NavigatorUtils.pushResult(context,MyRouter.page2,(result){
                  setState(() {
                    this.textStr="456";
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Page2State();
  }
}

class _Page2State extends State<Page2>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是第二个页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '我是第二个页面',
              style: TextStyle(fontSize: 32),
            ),
            OutlinedButton(
              child: Text('返回上一个界面'),
              onPressed: (){
                NavigatorUtils.goBackWithParams(context, "我返回的数据");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('你访问的页面不存在'),
      ),
      body: Center(
        child: Text(
          '你访问的页面不存在',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }

}


class Page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面3'),
      ),
      body: Center(
        child: Text(
          '页面3',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}



















