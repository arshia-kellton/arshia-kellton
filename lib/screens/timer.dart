import 'dart:async';

import 'package:demo_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TImer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ImageRotaterState();
}

class ImageRotaterState extends State<TImer> {

  var image =00;
  late Timer mytimer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("TimerApp")),
      body: _body(),
    );
  }

  _body() {
    return Center(
        child: SingleChildScrollView(
            child: SafeArea(
                top: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    imageWidget(),
                    startButton(),
                    stopButton()

                  ],
                ))));

  }
  Widget startButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0.0),
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child:  RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0)),
              color: Color(0xFF6bc334),
              child: new Text(
                "Start",
                style: TextStyle(
                    fontSize: Dimensions.textSmall, color: Colors.white),
              ),
              onPressed: startTime),
        ));
  }
  Widget imageWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration:
          const BoxDecoration(shape: BoxShape.rectangle, color: Colors.green),
          child:  Image.asset('images/frame_${image.toString().padLeft(2, '0')}_delay-0.04s.png',
            scale: 1.0,
            gaplessPlayback: true,



          ),
        ),
      ),
    );
  }

  Widget stopButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0.0),
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child:  RaisedButton(
              elevation: 5.0,
              shape:  RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0)),
              color: Color(0xFF6bc334),
              child:  Text(
                "Stop",
                style: TextStyle(
                    fontSize: Dimensions.textSmall, color: Colors.white),
              ),
              onPressed: stopTImer),
        ));
  }

  startTime()  {
    mytimer = Timer.periodic(Duration(milliseconds: 400), (timer) {
  print("timer started"+image.toString());
  setState(() {
    image = (image + 1) % 53;

  });



}) ;
  }
  stopTImer(){
    mytimer.cancel();
    image=0;
    print("timer stopped");

  }
}
