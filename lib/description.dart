import 'package:flutter/material.dart';
import 'package:flutter_chapter6/information.dart';

class DescriptionInfor extends StatelessWidget{
  final Information information;
  DescriptionInfor({required this.information});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.information.title),
      ),
      body: Center(
        child: Text(this.information.description,style: TextStyle(fontSize: 32),),
      ),
    );
  }
}