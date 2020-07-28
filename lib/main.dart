import 'package:flutter/material.dart';
import 'package:flutterapp/page/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Дюха Фитнесс',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
            subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            subtitle2: TextStyle(color: Colors.white),
        ),
      ),
      home: LandingPage(),
    );
  }
}

