import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("個人"),  
      ),
      body: new Center
      (
        child: new Text("這是個人頁面"),
      ),
    );
  }
}