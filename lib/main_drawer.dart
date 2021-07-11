import 'package:farmerapp/about.dart';
import 'package:farmerapp/contactus.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:farmerapp/start.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'accounts.dart';

//import 'homepage.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    //final googleSignIn = GoogleSignIn();
    // await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.green,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/2264075/pexels-photo-2264075.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                            fit: BoxFit.cover),
                      )),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'My Account',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_rounded),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              'Contact Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Sign Out',
              style: TextStyle(fontSize: 18),
            ),
            onTap: signOut,
          ),
        ],
      ),
    );
  }
}

/*@override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.green,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/2264075/pexels-photo-2264075.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                            fit: BoxFit.cover),
                      )),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'My Account',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_rounded),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              'Contact Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
       /*   ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Sign Out',
              style: TextStyle(fontSize: 18),
            ),
            onTap: null,
          ),*/
        ],
      ),
    );
  }
}
*/
