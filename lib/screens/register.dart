import 'package:demo_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';
 class Register extends StatefulWidget{
  @override
  State createState() => _RegisterState();
 }
class _RegisterState extends State<Register> {
  final _formKey = new GlobalKey<FormState>();
  late String _email, _password, _confirmPassword, _userName, _class;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(body: _body());
  }

  _body() {

      return Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  logo(),
                  loginText(),
                  line(),
                  usernameField(),
                  emailField(),
                  passwordField(),
                  confirmPasswordField(),
                  signUpButton(),
                  signUp()
                ],
              )));
    }
  Widget logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
      child: Center(
        child: Container(
          width: Dimensions.logoWidth,
          height: Dimensions.logoHeight,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green
          ),
          child: Image.asset('images/icon.png', scale: 4.0,),
        ),
    ),
      );
  }

  Widget loginText() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 30.0, 0.0),
        child: SizedBox(
          child: Row(
            children: <Widget>[
              Text(
                "SignUp",
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

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor: Color(0xFFe5d429),
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: Dimensions.textMedium, color: Colors.black),
        decoration: const InputDecoration(
            hintText: "Email id*",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5d429)))),
       // validator: (value) => value.isEmpty ? "Email is mandatory" : null,
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        onSaved: ( value) => _email = value!.trim(),
      ),
    );
  }

  Widget usernameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor: Color(0xFFe5d429),
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: Dimensions.textMedium, color: Colors.black),
        decoration: const InputDecoration(
            hintText: "Username*",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5d429)))),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        onSaved: (value) => _userName = value!.trim(),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20.0, 40.0, 0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor: Color(0xFFe5d429),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: Dimensions.textMedium, color: Colors.black),
        decoration: const InputDecoration(
            hintText: "Password*",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5d429)))),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        onSaved: (value) => _password = value!.trim(),
      ),
    );
  }

  Widget confirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20.0, 40.0, 0.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor: Color(0xFFe5d429),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: Dimensions.textMedium, color: Colors.black),
        decoration: const InputDecoration(
            hintText: "Confirm Password*",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5d429)))),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        onSaved: (value) => _confirmPassword = value!.trim(),
      ),
    );
  }



  Widget signUpButton() {
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
                "Create an Account",
                style: TextStyle(
                    fontSize: Dimensions.textSmall, color: Colors.white),
              ),
              onPressed: _performSignUp),
        ));
  }

  Widget signUp() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Already have an account ?  ",
                style: TextStyle(fontSize: 18, color: Colors.black54)),
            InkWell(
              onTap: _login,
              child: Text("Login",
                  style: TextStyle(
                    fontSize: Dimensions.textSmall,
                    color: Color(0xFF6bc334),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _login() {
    Navigator.of(context).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }



  _performSignUp() {
    final form = _formKey.currentState;
   print("Signup done!");
  }
}