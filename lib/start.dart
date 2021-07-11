import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
//import 'package:authentification/Login.dart';
//import 'SignUp.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToSignUp() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_01_2.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              child: Image(
                image: AssetImage("assets/images/Logo_01.png"),
                height: 140,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "FARMER'S FRIEND",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3C3C3C)),
            ),
            SizedBox(
              height: 200,
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  onPressed: navigateToLogin,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF)),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xFF000000),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                  onPressed: navigateToSignUp,
                  child: Text(
                    "SIGN-UP",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000)),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                SizedBox(height: 0),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
