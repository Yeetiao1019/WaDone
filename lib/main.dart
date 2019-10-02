import 'package:flutter/material.dart';
import 'package:wadon_1/HomePage.dart';
import 'package:wadon_1/Profile.dart';
import 'package:wadon_1/ActivityPage.dart';
import 'package:wadon_1/SubscriptionPage.dart';
import 'package:wadon_1/NotificationPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal.shade200,//上方欄底色
        primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.white, //上方欄字顏色
    )
  )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    SubscriptionPage(),
    ActivityPage(),
    NotificationPage(),
    Profile(),
    ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _children[_selectedIndex],
        bottomNavigationBar:new Theme(
          data:Theme.of(context).copyWith(
            canvasColor: Colors.teal[200], //下方欄底色
            //primaryColor: Colors.red,
            // textTheme: Theme
            //   .of(context)
            //   .textTheme
            //   .copyWith(caption: new TextStyle(color: Colors.yellow))
          ),
          child: BottomNavigationBar(
            
          items: <BottomNavigationBarItem>[
            
            new BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: new Text('主頁')),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.subscriptions),
              title: new Text('訂閱')),
             new  BottomNavigationBarItem(
              icon: const Icon(Icons.subtitles),
              title: new Text('活動')),
              new BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              title: new Text('通知')),
            new BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle),
              title: new Text('個人')),
          ],
          type:BottomNavigationBarType.shifting, //分頁效果
          currentIndex: _selectedIndex,
          fixedColor: Colors.blueGrey, //下方分頁點擊顏色
          onTap: _onItemTapped,   //分頁點擊事件
          ),
        ),
    );
  }
  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }
}
