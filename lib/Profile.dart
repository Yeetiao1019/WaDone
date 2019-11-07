import 'package:flutter/material.dart';
import 'Auth.dart';

class Profile extends StatefulWidget{
  Profile({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  _ProfileState createState() => _ProfileState();
}

enum FormType{
  login,
  register
}

class _ProfileState extends State<Profile>{
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;


  bool loginToFirebase(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
      //print('Form is valid. Email: $_email,password: $_password');
    }else{
      return false;
      //print('Form is invalid.Email: $_email,password: $_password');
    }
  }

  void validateAndSubmit() async{
    if(loginToFirebase()){
      try{
        if(_formType == FormType.login){
          String userId = await widget.auth.signInWithEmailAndPassword(_email,_password);
      //FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _password)).user;
      print('Signed in: $userId');
      }else{
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          //FirebaseUser user =(await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password: _password)).user;
          print('Registered user: $userId');
        }
        widget.onSignedIn();
      }
      catch(e){
        print('Error: $e');
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset(); //清除欄位(重置元件狀態)
    setState(() {
      _formType = FormType.register;
    });
    
  }

  void moveToLogin(){
    formKey.currentState.reset(); //清除欄位(重置元件狀態)
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new Container
      (
        padding: EdgeInsets.all(16.0), //與邊界間隔
        child:new Form
        (
          key: formKey,
          child: new Column
          (
            crossAxisAlignment: CrossAxisAlignment.stretch, //樣式
            children: buildInputs() + buildSubmitBottons()
          ),
        )
      ),
    );
  }

  List<Widget> buildInputs(){
    return[
              new TextFormField
              (
                decoration: new InputDecoration(labelText: 'Email'),
                validator: (value) => value.isEmpty ? 'Email can\'t not be empty.':null, //空值判斷
                onSaved: (value)=> _email=value,
              ),
              new TextFormField
              (
                decoration: new InputDecoration(labelText: 'Password'),
                validator: (value) => value.isEmpty ? 'Password can\'t not be empty.':null, //空值判斷
                obscureText: true, //密文
                onSaved: (value)=>_password=value,
              ),
    ];
  }

  List<Widget> buildSubmitBottons(){
    if(_formType == FormType.login){
    return [
              new RaisedButton
              (
                child: new Text('Login'),
                onPressed: validateAndSubmit,
              ),
              new FlatButton(
                child: new Text('Create an account.'),
                onPressed: moveToRegister,
              )
    ];
  }else{
        return [
              new RaisedButton
              (
                child: new Text('Create an account'),
                onPressed: validateAndSubmit,
              ),
              new FlatButton(
                child: new Text('Have an account? Login.'),
                onPressed: moveToLogin,
              )
    ];
  }
  }
}