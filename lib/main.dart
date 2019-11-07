import 'package:flutter/material.dart';
import 'package:wadon_1/Component.dart';
import 'package:wadon_1/Auth.dart';
import 'package:wadon_1/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //顯示'Debug'字樣
      title: 'WaDone',
      theme: ThemeData(
        primaryColor: Colors.teal.shade200,//上方欄底色
        primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.white, //上方欄字顏色
    )
  )
      ),
      home: new Component(auth: new Auth()));
  }
}

