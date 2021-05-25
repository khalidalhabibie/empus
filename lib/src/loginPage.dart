import 'package:empus/src/welcomePage.dart';
import 'package:flutter/material.dart';
/*
import 'package:DC19/src/signUp.dart';
import 'package:DC19/src/Home.dart';
import 'package:DC19/src/screentwo.dart';
*/
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
//import 'package:json_annotation/json_annotation.dart';
import 'widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController  = TextEditingController();
  final passwordController  = TextEditingController();
  String message = '';
  String username = "khalidalhabibie";
  String password = "123";
  bool isSuccess = false;
  


Future <bool> _login() async {

  String usernameUser = usernameController.text;
  String passwordUser = passwordController.text;

  if (usernameUser == username && passwordUser == password){
    isSuccess = true;
    return true;
  }
  return false;

}

  @override
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            Text('Back',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title,  myController ,{bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ), 
          TextField( 
              controller: myController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: title,
                  fillColor: Colors.white,
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                //offset: Offset(2, 4),
                //blurRadius: 5,
                //spreadRadius: 2
                )
          ],
         color: Colors.white),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Color(0xff2196f3),fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or',
            style: TextStyle(color: Colors.white)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

 

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {/*
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
                  */
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
           text: 'EMPUS',
          style: GoogleFonts.mcLaren(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'ss',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _usernamePasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("username",usernameController),
        _entryField("Password",passwordController, isPassword: false),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            //height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2196f3), Color(0xff03A9f4)])),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      _title(),
                      SizedBox(
                        height: 50,
                      ),
                      _usernamePasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        color:Colors.white,
                        child:
                        Text('Login',style: TextStyle(fontSize: 20, color: Color(0xff2196f3),fontWeight: FontWeight.bold),),
                        onPressed:()async{
                          _login(); // call login future

                          // check credential
                          if (isSuccess == true){
                            message = "success";
                            
                            Navigator.of(context).push(MaterialPageRoute(
                               builder: (context) => WelcomePage()));
                              
                          }
                          else{
                            message = "wrong credential";
                          }
                        }
                      ,
                      ),
                      Text(message,style: TextStyle(fontSize: 10.0,color: Colors.white),),
                      //Text(.toString(),style: TextStyle(fontSize: 20.0,color: Colors.red),),
                      //Text(token.length.toString(),style: TextStyle(fontSize: 20.0,color: Colors.red),),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _createAccountLabel(),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
                Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()
                    )
              ],
            ),
          )
        )
      );
  }
}
