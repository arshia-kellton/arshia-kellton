
import 'package:demo_app/constants/dimensions.dart';
import 'package:demo_app/screens/bmi/input_page.dart';
import 'package:demo_app/screens/quizmainscreen.dart';
import 'package:demo_app/screens/timer.dart';
import 'package:demo_app/screens/todo/add_task_screen.dart';
import 'package:demo_app/screens/todo/tasks_screen.dart';
import 'package:demo_app/screens/todo/widegt/tasks_list.dart';
import 'package:demo_app/screens/weather/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:demo_app/screens/chat/chat_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
    appBar: AppBar(
    title: Text('HomePage'),
      backgroundColor: Colors.green,
    ),
  body: _body(),
);
  }

  _body() {
    return Align(
        alignment: Alignment.center,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => InputPage()));
              },
            child: Text(

              "BMI Calculator",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.textLarge,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => TImer()));
              },
            child: Text(
              "TimerApp",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.textLarge,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Quizmainscreen()));  },
            child: Text(

              "QuizApp",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.textLarge,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
            },
            child: Text(
              "ChatApp",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.textLarge,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => TasksScreen()));
            },
            child: Text(
              "Todo",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.textLarge,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              color: Color(0xFF6bc334),
              child: Text(
                "Get Location",
                style: TextStyle(
                    fontSize: Dimensions.textExtraSmall, color: Colors.black),
              ),
              onPressed: getLocation)
        ],

      ),
    );

  }

   getLocation() {
     Navigator.push(context,
         MaterialPageRoute(builder: (BuildContext context) => LoadingScreen()));
     /*   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     print(position);*/

  }
}