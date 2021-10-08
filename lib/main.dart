import 'package:flutter/material.dart';
import 'package:sales/constants.dart';
import 'package:sales/screens/Home.dart';
import 'package:sales/screens/login/login.dart';
import 'package:sales/screens/sign_up/signup.dart';
import 'package:sales/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        
      ),
      debugShowMaterialGrid: false,
    
      home: WelcomeScreen(),
      routes: <String,WidgetBuilder>{
        "Login" : (BuildContext context)=>login(),
        "SignUp" : (BuildContext context)=>SignUp(),
        "welcome" : (BuildContext context)=>WelcomeScreen(),
        "Home" : (BuildContext context)=>Home(),
      }
    );
  }
}

