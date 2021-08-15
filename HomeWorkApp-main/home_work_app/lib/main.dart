import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/Splashscreen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(new MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Work Management App",
      home: new Splashscreen(),
    );
  }
}