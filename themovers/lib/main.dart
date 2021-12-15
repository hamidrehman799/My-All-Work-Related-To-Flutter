import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:themovers/screens/history_screen.dart';
import 'package:themovers/screens/home_screen.dart';
import 'package:themovers/screens/login%20&%20signup/otp_screen.dart';
import 'package:themovers/screens/ridehistory_screen.dart';
import 'package:themovers/screens/wallet_screen.dart';
import './screens/login%20&%20signup/register_screen.dart';
import './screens/landingpage.dart';

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
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
      routes: {
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        otpscreen.routeName: (ctx) => otpscreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        WalletScreen.routeName: (ctx) => WalletScreen(),
        HistoryScreen.routeName: (ctx) => HistoryScreen(),
        TripHistoryScreen.routeName: (ctx) => TripHistoryScreen(),
      },
    );
  }
}