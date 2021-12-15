import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getProportionateScreenHeight(40),
                        height: getProportionateScreenHeight(40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryblue,
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: kTextColorForth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenHeight(20),
              ),
              child: SizedBox(
                height: getProportionateScreenWidth(50),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(100),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: new DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(30),
                ),
                child: ListView(
                  children: [

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
