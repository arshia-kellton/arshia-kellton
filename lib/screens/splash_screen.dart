import 'dart:async';
import 'dart:convert';
import 'package:demo_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo_app/utilities/sharedPrefrence.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    bool? status = await SharedPrefUtil.getLoginStatus("LOGIN_STATUS");
    if (status==true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    }
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
          child: Container(
        child:  Image.asset('images/icon.png'),
      )),
    );
  }
}
