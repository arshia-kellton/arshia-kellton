import 'package:demo_app/screens/splash_screen.dart';
import 'package:demo_app/screens/todo/add_task_screen.dart';
import 'package:demo_app/screens/todo/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp(
  ));

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:SplashScreen()
      ),
    );
  }
}
