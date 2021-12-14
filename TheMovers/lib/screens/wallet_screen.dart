import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themovers/screens/history_screen.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';

import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/WalletScreen';

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(20),
            horizontal: getProportionateScreenHeight(20),
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
                  height: getProportionateScreenHeight(150),
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
                                'Balance',
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
                            top: getProportionateScreenWidth(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4200',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(10),
                                ),
                                child: Text(
                                  'PKR',
                                  style: TextStyle(
                                    fontSize: 16,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Transaction History',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
               Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        Card2(),

                      ],
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0.0, 1.0),
            blurRadius: 2.0,
            spreadRadius: 0.0,
            // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: kTextColorForth,
      ),
      height: getProportionateScreenHeight(70),
      child: ListTile(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(7.5),
              ),
              child: Text(
                "WithDrawl",
                style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold,),
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Padding(
              child: Text(
                "Nov 3, 3:12 PM",
                style: TextStyle(fontSize: 14),
              ),
              padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(10),
              ),
            ),
          ],
        ),
        trailing: Text('165',style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),),
        onTap: (){

        },

      ),
    );
  }
}
