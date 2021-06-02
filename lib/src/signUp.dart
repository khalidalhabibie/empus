import 'package:flutter/material.dart';
import 'widget/bezierContainer.dart';
import '/src/signIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String message = '';
  bool isSuccess = false;
  bool isNotNullValid = false;
  bool isValid = false;
  bool isEmailValid = false;

  //dispose
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // check email is valid
  bool _isEmailValidor(String value) {
    if (EmailValidator.validate(value) == true) {
      return isNotNullValid = true;
    }
    return isNotNullValid = false;
  }

  // check controller it's not nil
  bool _isNotNull(String value) {
    if (value != "") {
      return isValid = true;
    }
    return isValid = false;
  }

  // back button
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

  Widget _entryField(String title, myController,
      {bool isPassword = false, bool isEmail = false}) {
    //check controller , it's null?
    //check email valid
    if (isEmail == true &&
        _isEmailValidor(myController.text.toLowerCase()) == true) {
      isEmailValid = true;
    }

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

  Widget _signInAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Text(
              'sign In',
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
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.bodyText2,
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

  Widget _inputDatadWidget() {
    return Column(
      children: <Widget>[
        _entryField("username", _usernameController),
        _entryField("email", _emailController, isEmail: true),
        _entryField("password", _passwordController, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
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
                  height: 10,
                ),
                _inputDatadWidget(),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff2196f3),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // check  controll it's not null
                      if ((_isNotNull(_usernameController.text) &&
                              _isNotNull(_emailController.text) &&
                              _isNotNull(_passwordController.text)) ==
                          true) {
                        setState(() {
                          isNotNullValid = true;
                        });
                      }
                      // if valid
                      if (isNotNullValid == true && isEmailValid == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }
                      // if it's valid
                      else {
                        setState(() {
                          message = "data invalid";
                        });
                      }
                    }),
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
            child: _signInAccountLabel(),
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
