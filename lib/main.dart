

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'application.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router?.generator,
      home: HomePage(),
    );
  }
}