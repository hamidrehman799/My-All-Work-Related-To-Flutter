import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoverx/google.dart';
import 'package:themoverx/googlemaap.dart';
import 'package:themoverx/pubexample.dart';
import 'package:themoverx/splashscreen/exstra.dart';
import 'package:themoverx/testing.dart';

import 'newtest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The themoverx',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      theme: ThemeData.light().copyWith(
          // primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      home: Extra(),
    );
  }
}
