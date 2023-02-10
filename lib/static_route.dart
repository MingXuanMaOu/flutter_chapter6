
import 'package:flutter/material.dart';
import 'package:flutter_chapter6/errorpage.dart';
import 'package:flutter_chapter6/main.dart';
import 'package:flutter_chapter6/pageroutes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/page1': (context) => PageRoutes(title: '跳转界面1')
      },
      onUnknownRoute: (RouteSettings settings){
        String? name = settings.name;
        return new MaterialPageRoute(builder: (context){
          return new ErrorPage();
        });
      },
      home: MyHomePage(title: '静态路由',),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text('跳转到页面1'),
          onPressed: (){
            Navigator.pushNamed(context, '/page1');
          },
        ),
      ),
    );
  }
}











