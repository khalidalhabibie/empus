


import 'package:empus/src/welcome.dart';

import 'signIn.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart' as painting;
import 'package:flutter/services.dart';

import 'package:flutter/services.dart';


 
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final emailController  = TextEditingController();
  final passwordController  = TextEditingController();  
  String urlImage = 'https://cataas.com/cat';

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

  
  Widget _logoutButton() {
    return InkWell(
      onTap: () {
       Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Welcome()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.logout, color: Colors.white),
            ),
            Text('logout',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white))
          ],
        ),
      ),
    );
  }

  @override
  Widget _refreshButton() {
    return InkWell(
      onTap: () {
        
        if  (urlImage == "https://cataas.com/cat"){
             setState(() {
             urlImage = "https://cataas.com/c";
        });
       }
       else{
         setState(() {
           urlImage = "https://cataas.com/cat";
         });
       }
       

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.refresh_rounded,color: Colors.white),
            ),
            Text('refresh',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white))
          ],
        ),
      ),
    );
  }



  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        return Scaffold(
          appBar: AppBar(
          
          automaticallyImplyLeading: false,
          actions: [  _backButton(), _refreshButton(),_logoutButton(),  ],
        ),
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
                      width:MediaQuery.of(context).size.width ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          Text("Selamat Datang Khalid ",textAlign:TextAlign.center,style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold)),
                           SizedBox(
                            height: 40,
                          ), 
                          SizedBox(
                            height: 300,
                            width :MediaQuery.of(context).size.width ,
                            child: 
                                Image.network(urlImage),
                          ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                
               
            
           
               //Positioned(top: 40, left: 5, child: _backButton()),
               //Positioned(top: 40, right: 5, child: _logoutButton()),
               //Positioned(bottom: 40, left: 10, child: _refreshButton()),
               // Positioned(
                    //top: -MediaQuery.of(context).size.height * .15,
                    //right: -MediaQuery.of(context).size.width * .4,
                    
                    //child: BezierContainer())
              ],
                        
            ),
          )
        )
      );
  }
}
