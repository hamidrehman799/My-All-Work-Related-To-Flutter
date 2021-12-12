import 'package:flutter/material.dart';
import 'package:thexmovers/screens/home_screen.dart';
import 'package:thexmovers/screens/login%20&%20signup/otp_screen.dart';
import './screens/login%20&%20signup/register_screen.dart';
import './screens/landingpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
      routes: {
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        otpscreen.routeName: (ctx) => otpscreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}