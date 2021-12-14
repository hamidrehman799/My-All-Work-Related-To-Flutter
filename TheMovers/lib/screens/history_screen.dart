import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themovers/screens/ridehistory_screen.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';

import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/HistoryScreen';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenHeight(12),
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
                height: getProportionateScreenWidth(150),
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
                              'History',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '420',
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(160),
                  child: ElevatedButton(

                      onPressed: () {

                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryblue),

                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(getProportionateScreenWidth(15),),
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: 14,
                            color: kTextColorForth,
                          ),
                        ),
                      ),
                      ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(160),
                  child: ElevatedButton(

                    onPressed: () {

                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryblue),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(getProportionateScreenWidth(15),),
                      child: Text(
                        'Cancelled',
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColorForth,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(20),
              ),
              child: Row(
                children: [
                  Text(
                    'Trips History',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                  children: [
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                  ],
                ),

            ),

          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
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
        leading: Column(
          children: [
            Text(
              '7:32',
              style: TextStyle(
                color: kTextColorForth,
              ),
            ),
            Text(
              'Am',
              style: TextStyle(
                color: kTextColorForth,
              ),
            ),
          ],
        ),
        title:  Stack(

            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(7),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                    ),
                    Text(
                      "Naeem Surgical Hospital",
                      style: TextStyle(
                        fontSize: 12,
                        color: kTextColorForth,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(19),
                ),
                child: Divider(
                  color: kTextColorForth,
                ),
              ),
            ],
          ),

        subtitle: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: kTextColorForth,
                    ),
                    Text(
                      "manawa, yadgar stop",
                      style: TextStyle(
                        fontSize: 11,
                        color: kTextColorForth,
                      ),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: getProportionateScreenWidth(14),),
                            child: Text(
                              "Date: 22-11-2021",
                              style: TextStyle(
                                fontSize: 11,
                                color: kTextColorForth,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 13,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 13,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 13,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 13,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 13,
                          ),
                        ],
                      ),
                    ],
                  ),

              ],
            ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

                  Text(
                    '165 PKR',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: kTextColorForth,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(10),),
              child: Text(
                'Cash',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: kTextColorForth,
                ),
              ),
            ),
                ],

        ),
        onTap: () {
          Navigator.of(context).pushNamed(TripHistoryScreen.routeName);
        },
      ),
    );
  }
}
