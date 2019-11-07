import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:wadon_1/Auth.dart';
import 'package:wadon_1/Profile.dart';

class HomePage extends StatefulWidget{
  
  // HomePage({this.auth});
  // final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

// enum AuthStatus{
//   notSignedIn,
//   SignedIn
// }

class _HomePageState extends State<HomePage> {
  // AuthStatus authStatus = AuthStatus.notSignedIn;

  // @override
  //  initState(){
  //   super.initState();
  //   widget.auth.currentUser().then((userId){
  //     setState((){
  //       //authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
  //     });
  //   });
  // }

  // void _signedIn(){
  //   setState(() {
  //     authStatus = AuthStatus.SignedIn;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // switch (authStatus){
    //   case AuthStatus.notSignedIn:
    //     return new Profile(
    //       auth: widget.auth,
    //       onSignedIn: _signedIn,
    //     );
    //   case AuthStatus.SignedIn:
      return new Scaffold(
      body: Container(
          height: 250.0,
          width: 500.0,
          padding: const EdgeInsets.all(8.0),
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: true, //自動播放
            //autoplayDuration: Duration(milliseconds: 100),持續滑動過場時間
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1300),
            dotSize: 6.0,
            dotIncreasedColor: Colors.blueGrey,
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            images: [
              NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              ExactAssetImage('image/dog_akitainu.png'),
            ],
          ),
        ),  
    );   
    }
  }
//}
