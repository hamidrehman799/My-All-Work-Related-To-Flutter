import 'package:flutter/material.dart';
import '../screens/splash%20screen/splash_screen.dart';
import '../utils/screen_utils.dart';


class LandingScreen extends StatefulWidget {
  static const routeName = '/LandingPage';
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      //upperBound: 250, while using curves don't use upper bound
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        ));
      }
    });

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: animation.value * 101,
            ),
          ],
        ),
      ),
    );
  }
}
