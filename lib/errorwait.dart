import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class errorwait extends StatefulWidget {
  //const errorwait({ Key? key }) : super(key: key);

  @override
  _errorwaitState createState() => _errorwaitState();
}

// ignore: camel_case_types
class _errorwaitState extends State<errorwait> {

 /* @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2));
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: SpinKitFadingCube(
          color : Colors.white,
          size: 50,
        ),
      ),
    );
  }
}