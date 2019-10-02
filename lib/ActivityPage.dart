import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget{
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("活動"),  
      ),
      body: new Center
      (
        child: new Text("這是活動"),
      ),
    );
  }
}