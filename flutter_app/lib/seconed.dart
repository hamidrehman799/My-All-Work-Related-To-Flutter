import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
       appBar: AppBar(
       backgroundColor: Colors.black,
       leading: Icon(Icons.menu),
    title: Center(
    child: Text(
    "Profile",
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ),
    actions: [Icon(Icons.search)],
    ),
       )

   );
  }}