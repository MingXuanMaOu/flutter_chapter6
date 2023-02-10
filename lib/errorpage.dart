import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('您访问的页面不存在'),
      ),
      body: Center(
        child: Text(
          '你访问的页面不存在',
          style: TextStyle(
            fontSize: 32,
            color: Colors.greenAccent
          ),
        ),
      ),
    );
  }
}