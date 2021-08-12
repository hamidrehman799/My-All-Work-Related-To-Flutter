import 'package:flutter/material.dart';
import 'package:sessional01_screens/screens/screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seasonal',
      theme: ThemeData(primaryColor: Color.fromRGBO(68, 5, 246, 1)),
      home: LoginScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
