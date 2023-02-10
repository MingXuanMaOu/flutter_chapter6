import 'package:flutter/material.dart';
import 'package:flutter_chapter6/description.dart';
import 'package:flutter_chapter6/information.dart';
import 'package:flutter_chapter6/main.dart';
import 'package:flutter_chapter6/pageroutes.dart';

import 'errorpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DynamicRoutePage(title: '动态路由',),
    );
  }
}

class DynamicRoutePage extends StatefulWidget{
  final String title;
  DynamicRoutePage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DynamicRoutePageState();
  }
}

class _DynamicRoutePageState extends State<DynamicRoutePage>{
  final informations = List<Information>.generate(20, (index) => Information('资讯$index', '资讯$index的详细内容'));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: ListView.builder(
          itemCount: informations.length,
          itemBuilder: (BuildContext,index){
            return ListTile(
              title: Text(informations[index].title),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionInfor(information: informations[index])));
              },
            );
          }),
    );
  }
}



















