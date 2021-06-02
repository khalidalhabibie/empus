import 'package:flutter/material.dart';

import 'signUp.dart';

import 'home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/bezierContainer.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final String username = "khalid";
  final String password = "123";

  String message = '';
  bool isSuccess = false;

  //dispose
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //username and password validation
  bool _isValid(String name, String pass) {
    if (name == username && pass == password) {
      isSuccess = true;
      return true;
    }
    return false;
  }

  //back button
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }

  // entry field
  Widget _entryField(String title, myController, {bool isPassword = false}) {
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

  // title
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'EMPUS',
          style: GoogleFonts.mcLaren(
            textStyle: Theme.of(context).textTheme.bodyText1,
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

  //username and password
  Widget _usernamePasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("username", _usernameController),
        _entryField("Password", _passwordController, isPassword: true),
      ],
    );
  }

  //create accountLable
  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text(
              'Sign Up',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
                  color: Colors.white,
                  child: Text(
                    'sign In',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff2196f3),
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    isSuccess = _isValid(
                        _usernameController.text, _passwordController.text);
                    // call signIn future
                    // check credential
                    if (isSuccess == true) {
                      setState(() {
                        message = "success";
                      });

                      isSuccess = false;
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Home(),
                        ),
                      );
                    } else {
                      setState(() {
                        message = "wrong credential";
                      });
                    }
                  },
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: 13.0, color: Colors.red),
                ),
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
              child: BezierContainer())
        ],
      ),
    )));
  }
}
