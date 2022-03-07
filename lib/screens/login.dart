import 'dart:async';

import 'package:demo_app/screens/homepage.dart';
import 'package:demo_app/screens/quizmainscreen.dart';
import 'package:demo_app/screens/register.dart';
import 'package:demo_app/screens/timer.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/constants/dimensions.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo_app/utilities/sharedPrefrence.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  String _emailResult = "", _passwordResult = "";
  TextEditingController userNameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(body: _body());
  }

  _body() {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,

      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: SafeArea(
                  top: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      logo(),
                      loginText(),
                      line(),
                      emailField(),
                      passwordField(),
                      loginButton(),
                      signUp(),
                      emailResult(),
                      pwdResult()
                    ],
                  )))),
    );
  }
  Widget loginText() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 30.0, 0.0),
        child: SizedBox(
          child: Row(
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.textLarge,
                  color: Color(0xFF90d166),
                ),
              ),
            ],
          ),
        ));
  }

  Widget line() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
        child: Container(
          height: 4.0,
          width: 20.0,
          color: Color(0xFFe5d429),
        ));
  }
  Widget logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
      child: Center(
        child: Container(
          width: Dimensions.logoWidth,
          height: Dimensions.logoHeight,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: Image.asset(
            'images/icon.png',
            scale: 4.0,
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0.0),
      child: TextFormField(
        controller: userNameController,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor: const Color(0xFFe5d429),
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: Dimensions.textMedium, color: Colors.black),
        decoration: const InputDecoration(
            hintText: "Email-id",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5d429)))),
        onSaved: (value) => _email = value!.trim(),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter name';
          }
          return null;
        },
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 30.0, 40.0, 0.0),
      child: TextFormField(
        controller: passwordController,
        maxLines: 1,
        cursorColor: const Color(0xFFe5d429),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: Dimensions.textMedium, color: Colors.black),
        decoration: const InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5d429)))),
        onSaved: (value) => _password = value!.trim(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter  password';
          }
          return null;
        },
      ),
    );
  }
  Widget loginButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0.0),
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child: RaisedButton(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              color: Color(0xFF6bc334),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: Dimensions.textExtraSmall, color: Colors.white),
              ),
              onPressed: _performLogin),
        ));
  }

  Widget emailResult() {
    return  Padding(
        padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0.0),
        child: Text(_emailResult,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            )));
  }

  Widget pwdResult() {
    return  Padding(
        padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0.0),
        child: Text(_passwordResult,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            )));
  }
  Widget signUp() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Don't have an account?  ",
                style: TextStyle(
                    fontSize: Dimensions.textExtraSmall,
                    color: Colors.black54)),
            InkWell(
                child: Text("SignUp",
                    style: TextStyle(
                      fontSize: Dimensions.textSmall,
                      color: Color(0xFF6bc334),
                    )),
                onTap: _signUp),
          ],
        ),
      ),
    );
  }
  _signUp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Register()));
  }
  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
        r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.trim().toString().length == 0) {
      return "Enter email-id";
    } else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String? validatePassword(String value) {
    _password = value;
    if (value.trim().length == 0) {
      return "Enter password";
    } else if (value.length <= 8)
      return 'Password must be more than 8 character';
    else
      return null;
  }

  _performLogin() async {
    final form = _formKey.currentState;
    if (_formKey.currentState!.validate()) {
      form!.save();
      /*Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));*/
      {
        setState(() {
          showSpinner = true;
        });
        try {
          final user = await _auth.signInWithEmailAndPassword(
              email: userNameController.text,
              password: passwordController.text);
          if (user != null) {
            SharedPrefUtil.setLoginStatus("LOGIN_STATUS", true);

            Navigator.push(context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
          }

          setState(() {
            showSpinner = false;
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }


}
