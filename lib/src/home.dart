
import 'signIn.dart';
import 'package:flutter/material.dart';
import 'signUp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





import 'widget/bezierContainer.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final emailController  = TextEditingController();
  final passwordController  = TextEditingController();
  String profil = '';
  String token ='';
  String msg ='';
  String nama='';
  String email='';
  String nomorTelpon='';

  //tambahan
  String barcode='';
  
  String dataGet='';
  String suhu='';
  ///////posttouser
  String statusCode='';






Future _getProfil(token) async {
  
}

Future _Logout(token)async{
  
}

///tambahan
///
// get data from url 
Future _getData(barcode) async {
  
}


//post suhu to api 
Future _postDataUser(suhu) async {
  
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
/*
  @override
  Widget _profilButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => _sigIn()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            Text('Profil',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white))
          ],
        ),
      ),
    );
  }

   @override
  Widget _logoutButton(token) {
    return InkWell(
      onTap: () {
        _Logout(token);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => signInPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.logout, color: Colors.white),
            ),
            Text('Keluar',
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
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
           text: 'DC',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: '19',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email",emailController),
        _entryField("Password",passwordController, isPassword: true),
      ],
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
            height: MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width ,
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
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          //_title(),
                          SizedBox(
                            height: 50,
                            
                          ),
                          
                          Text("Selamat Datang ",textAlign:TextAlign.center,style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold)),
                          
                          SizedBox(
                            height: 10,
                          ),
                          Text(nama,textAlign:TextAlign.left,style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          //Text(nomorTelpon,textAlign:TextAlign.left,style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 50,
                            
                          ),    
                          
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                /*
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _createAccountLabel(),
                ),
                */
                Positioned(top: 40, left: 0, child: _backButton()),
                //Positioned(top: 40, right: 0, child: _backButton()),
                //Positioned(top: 40, right: 0, child: _profilButton()),
               // Positioned(bottom: 0, right: 0, child: _logoutButton(token)),
                Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer())
              ],
            ),
          )
        )
      );
  }
}
