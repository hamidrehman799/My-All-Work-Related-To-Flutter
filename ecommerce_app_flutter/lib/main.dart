
import 'package:flutter/material.dart';
import './constants/colors.dart';
import './utils/screen_utils.dart';
import './screens/landing_screen.dart';
import './utils/custom_theme.dart';
import './screens/intro_screen.dart';
import './screens/login_screen.dart';
import './screens/Signup_screen.dart';
import './screens/add_address_screen.dart';
import './screens/map_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (context, constraints) {
        print(constraints.maxWidth);
        final customTheme = CustomTheme(constraints);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce Crypto',
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: customTheme.nunito(),
            elevatedButtonTheme: customTheme.elevatedButtonTheme(),
            outlinedButtonTheme: customTheme.outlinedButtonTheme(),
            dividerTheme: customTheme.dividerTheme(),
          ),
          home: LandingScreen(),
          routes:
          {
            IntroScreen.routName: (ctx) => IntroScreen(),
            LoginScreen.routName: (crx) => LoginScreen(),
            SignupScreen.routName: (ctx) => SignupScreen(),
            AddAddressScreen.routName: (ctx) => AddAddressScreen(),
            MapScreen.routName: (ctx) => MapScreen(),
          },
        );
      },
    );
  }
}
