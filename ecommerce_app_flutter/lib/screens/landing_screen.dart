import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../screens/intro_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(

        body: SafeArea(
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
            Image.asset('assets/Images/landing.png', fit: BoxFit.cover,),
            IntroWidget(),

          ],
      ),
    ),
        );
  }
}

class IntroWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
            20,
          )

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                Expanded(
                  flex: 2,
                  child: Text('Welcome To Crypto',
                  style: Theme.of(context).textTheme.headline2.copyWith(
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
            Text('We Have More Then 10000 Btc To Offer you guys',
              style: Theme.of(context).textTheme.headline4.copyWith(color: kTextColorAccent),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: ()
              {
                Navigator.of(context).pushNamed(IntroScreen.routName);
              },
              child: Text('Lets Start This'),),
            Spacer(),
          ],

    ),
      ),
    );
  }
}
