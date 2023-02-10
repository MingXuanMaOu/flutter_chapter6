import 'package:flutter/material.dart';

class PageRoutes extends StatelessWidget{
  final String title;
  PageRoutes({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              this.title,
              style: TextStyle(
                fontSize: 32,
                color: Colors.greenAccent
              ),
            ),
            OutlinedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('返回上一个界面'))
          ],
        ),
      ),
    );
  }
}