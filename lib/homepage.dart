//import 'package:authentification/Start.dart';
//import 'dart:convert';
import 'dart:async';

import 'package:percent_indicator/percent_indicator.dart';
//import 'package:farmerapp/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import './main_drawer.dart';
//import 'reading.dart';
//import 'package:http/http.dart' as http;
///import 'package:dio/dio.dart';
import 'database_api.dart';
//import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  final DataApi api = DataApi();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  List list = [];
  List sort = [];
  bool isLoading = false;
  Timer timer;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    widget.api.getreadings().then((data) {
      setState(() {
        list = data;
        sort = list;
        isLoading = false;
        print(sort);
      });
    });
  }

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
  void initState() {
    Timer(Duration(seconds: 5), () {
      // loading icon showing
      super.initState();
    });

    this.checkAuthentification();
    this.getUser();
    this._fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black12,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Home'),
            ),
            drawer: MainDrawer(),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home_02.png"),
                      fit: BoxFit.cover)),
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Container(
                  child: !isloggedin
                      ? CircularProgressIndicator()
                      : Column(children: [
                          Container(
                            padding: EdgeInsets.only(top: 7),
                            child: Text(
                              "Light",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 35.0,
                              percent: double.parse(
                                  (double.parse(list[0]["Light"]) / 100)
                                      .toStringAsFixed(1)),
                              center: Text(
                                (double.parse(list[0]["Light"])
                                    .toStringAsPrecision(3)),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.green[400],
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          Container(
                            child: Text(
                              "Rain",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 35.0,
                              percent: double.parse(
                                  (double.parse(list[0]["Rain"]) / 100)
                                      .toStringAsFixed(1)),
                              center: Text(
                                (double.parse(list[0]["Rain"])
                                    .toStringAsPrecision(3)),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.green[400],
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Soil Temperature ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: double.parse((double.parse(
                                                    list[0]
                                                        ["Temperature Soil"]) /
                                                100)
                                            .toStringAsFixed(1)),
                                        center: Text(
                                          (double.parse(list[0]
                                                      ["Temperature Soil"])
                                                  .toStringAsPrecision(3)) +
                                              "°C",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightGreenAccent),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.lightGreen,
                                      )),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Air Temperature ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: double.parse((double.parse(
                                                    list[0]
                                                        ["Temperature Air"]) /
                                                100)
                                            .toStringAsFixed(1)),
                                        center: Text(
                                          (double.parse(list[0]
                                                      ["Temperature Air"])
                                                  .toStringAsPrecision(3)) +
                                              "°C",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightGreenAccent),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.lightGreen,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Air Humidity",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  /*Container(
                              margin: const EdgeInsets.only(
                                  bottom: 0, top: 50, right: 230),
                              //color: Colors.amber[600],
                              width: 100,
                              height: 100,
                              child: SfRadialGauge(axes: <RadialAxis>[
                                RadialAxis(
                                    minimum: 0,
                                    maximum: 150,
                                    ranges: <GaugeRange>[
                                      GaugeRange(
                                          startValue: 0,
                                          endValue: 50,
                                          color: Colors.green),
                                      GaugeRange(
                                          startValue: 50,
                                          endValue: 100,
                                          color: Colors.orange),
                                      GaugeRange(
                                          startValue: 100,
                                          endValue: 150,
                                          color: Colors.red)
                                    ],
                                    pointers: <GaugePointer>[
                                      NeedlePointer(
                                          value: double.parse(
                                              list[0]["Temperature Air"]))
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                          widget: Container(
                                              child: Text(
                                                  list[0]["Temperature Air"],
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          angle: 90,
                                          positionFactor: 0.5)
                                    ])
                              ])),
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: 0, top: 50, right: 230),
                              //color: Colors.amber[600],
                              width: 100,
                              height: 100,
                              child: SfRadialGauge(axes: <RadialAxis>[
                                RadialAxis(
                                    minimum: 0,
                                    maximum: 150,
                                    ranges: <GaugeRange>[
                                      GaugeRange(
                                          startValue: 0,
                                          endValue: 50,
                                          color: Colors.green),
                                      GaugeRange(
                                          startValue: 50,
                                          endValue: 100,
                                          color: Colors.orange),
                                      GaugeRange(
                                          startValue: 100,
                                          endValue: 150,
                                          color: Colors.red)
                                    ],
                                    pointers: <GaugePointer>[
                                      NeedlePointer(
                                          value: double.parse(
                                              list[0]["Temperature Air"]))
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                          widget: Container(
                                              child: Text(
                                                  list[0]["Temperature Air"],
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          angle: 90,
                                          positionFactor: 0.5)
                                    ])
                              ]))*/
                                  Container(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: double.parse((double.parse(
                                                    list[0]["Humidity Air"]) /
                                                100)
                                            .toStringAsFixed(1)),
                                        center: Text(
                                          (double.parse(list[0]["Humidity Air"])
                                                  .toStringAsPrecision(3)) +
                                              "%",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightGreenAccent),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.lightGreen,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Soil Moisture",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: double.parse((double.parse(
                                                    list[0]["Soil Moisture"]) /
                                                100)
                                            .toStringAsPrecision(3)),
                                        center: Text(
                                          (double.parse(
                                                      list[0]["Soil Moisture"])
                                                  .toStringAsPrecision(3)) +
                                              "%",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightGreenAccent),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.lightGreen,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            onPressed: () => _fetchData(),
                            child: Text('Fetch data',
                                style: TextStyle(
                                    color: Colors.green[800],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /*RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            onPressed: signOut,
                            child: Text('Sign out',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),*/
                        ])),
            )));
  }

  /*Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        drawer: MainDrawer(),
        body: Container(
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    SizedBox(height: 100),
                    Container(
                      child: Text(
                        "Time is ${list.length} you are Logged in as ${list.length}",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      onPressed: () => _fetchData(),
                      child: Text('Fetch data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      onPressed: signOut,
                      child: Text('Sign out',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  ],
                ),
        ));
  }
}*/
}
