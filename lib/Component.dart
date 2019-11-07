import 'package:flutter/material.dart';
import 'package:wadon_1/Auth.dart';
import 'package:wadon_1/HomePage.dart';
import 'package:wadon_1/Profile.dart';
import 'package:wadon_1/ActivityPage.dart';
import 'package:wadon_1/SubscriptionPage.dart';
import 'package:wadon_1/NotificationPage.dart';

class Component extends StatefulWidget {
  // Component({Key key, this.title}) : super(key: key);
  // final String title;
   Component({this.auth});
   final BaseAuth auth;
  @override
  _ComponentState createState() => _ComponentState();
}

enum AuthStatus{
  notSignedIn,
  signedIn
}

class _ComponentState extends State<Component> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  
  @override
  void initState(){
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        //authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    SubscriptionPage(),
    ActivityPage(),
    NotificationPage(),
    Profile(),
    ];

  void _signedIn(){
    setState((){
      authStatus = AuthStatus.signedIn;
    });
  }

  @override
  Widget build(BuildContext context){
    switch (authStatus){
      case AuthStatus.notSignedIn:
        return new Profile(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return new Scaffold(
      appBar: new AppBar(
      leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,size: 30.0,),
              onPressed: (){
                Scaffold.of(context).openDrawer(); //點擊menu打開Drawer
              },
            );
          }),
      ),
      drawer: Drawer(
        child: ListView(
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountEmail: Text('foo@nkust.edu.tw'), 
        accountName: Text('陳三斤'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('image/dog_akitainu.png'),
        ),
      ),
      ExpansionTile(  //可展開列表
        title: Text('已訂閱社團'),
        children: <Widget>[ //子列表
          new ListTile(
              title: const Text('典雅國樂社'),
              leading: CircleAvatar(
                backgroundImage:AssetImage('image/cmc.jpg'), //子列表圖片
              ),
              onTap: () {
                setState(() {
                });
              },              
            ),
        ],
        //subtitle: Text('ListSubtitle1',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("訂")),
      ),
      ExpansionTile(
        title: Text('服務性社團'),
        //subtitle: Text('ListSubtitle1',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("服")),
      ),
     ExpansionTile(
        title: Text('學術性社團'),
        //subtitle: Text('ListSubtitle2',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("學")),
      ),
      ExpansionTile(
        title: Text('康樂性社團'),
        //subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("康")),
      ),
      ExpansionTile(
        title: Text('體育性社團'),
        //subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("體")),
      ),
      ExpansionTile(
        title: Text('系學會'),
        //subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("系")),
      ),
      Divider(),//分割線
      new AboutListTile(
        icon: new CircleAvatar(),
        child: new Text("關於WaDone"),
        applicationName: "WaDone",
        applicationVersion: "1.0",
        applicationLegalese: "NKUST IC",
        aboutBoxChildren: <Widget>[
          new Text("文字"),
          new Text("文字")
        ],
      ),
      Divider(),//分割線
    ],
  ),
      ),
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
          showSelectedLabels: true,   // 顯示已選擇之底部選項
          showUnselectedLabels: true, // 顯示未選擇之底部選項
          ),
        ),
    );
    }

  }
  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }
}