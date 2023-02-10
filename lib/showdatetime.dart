

import 'package:flutter/material.dart';
import 'package:flutter_chapter6/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataTimePage(title: '参数回传'),
    );
  }
}

class DataTimePage extends StatefulWidget{
  final String title;
  DataTimePage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataTimePageState();
  }
}

class _DataTimePageState extends State<DataTimePage>{
  String _year = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: (){
              _navigatorToShowDate();
            }, child: Text('选择出生年份')),
            Text('$_year')
          ],
        ),
      ),
    );
  }
  _navigatorToShowDate() async{
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDateTime()));
    setState((){
      _year = result;
    });
  }
}

class ShowDateTime extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('请选择你的出生省份'),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(onPressed: (){
              Navigator.pop(context,'1992');
            }, child: Text('1992')),
            OutlinedButton(onPressed: (){
              Navigator.pop(context,'1995');
            }, child: Text('1995')),
            OutlinedButton(onPressed: (){
              Navigator.pop(context,'1998');
            }, child: Text('1998')),
          ],
        ),
      ),
    );
  }
}












