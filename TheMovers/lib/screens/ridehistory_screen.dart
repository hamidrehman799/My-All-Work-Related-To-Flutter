import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';

import 'package:flutter/material.dart';

class TripHistoryScreen extends StatefulWidget {
  static const routeName = '/TripHistoryScreen';

  @override
  State<TripHistoryScreen> createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenHeight(28),
        ),
        child: Column(
          children: <Widget>[
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
            // construct the profile details widget here
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
                              'Trip Detail',
                              style: TextStyle(
                                fontSize: 32,
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



            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    TripHistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),

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

class TripHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0.0, 2.0),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: kPrimaryblue,
      ),
      height: getProportionateScreenHeight(85),
      child: ListTile(
        title:  Stack(

          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(15),
                left: getProportionateScreenHeight(15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: kSuccess,
                  ),
                  Text(
                    "Naeem Surgical Hospital,Lahore",
                    style: TextStyle(
                      fontSize: 15,
                      color: kTextColorForth,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(30),),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(19),
                ),
                child: Divider(
                  color: kTextColorForth,
                ),
              ),
            ),
          ],
        ),

        subtitle: Padding(
          padding: EdgeInsets.only(



            left: getProportionateScreenHeight(15),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: kAlert,
                  ),
                  Text(
                    "manawa, yadgar stop,Lahore",
                    style: TextStyle(
                      fontSize: 15,
                      color: kTextColorForth,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
