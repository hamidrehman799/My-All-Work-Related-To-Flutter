import 'package:flutter/material.dart';
import 'package:themovers/screens/mapscreen.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';


class HomeGrid extends StatelessWidget {
  const HomeGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(15),
      ),
      decoration: BoxDecoration(
        color: kPrimaryblue,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(MapScreen.routeName);
                  },
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: getProportionateScreenWidth(99),
                      height: getProportionateScreenWidth(99),
padding: EdgeInsets.all(getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            // changes position of shadow
                          ),
                        ],

                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 4.0,
                                     // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                'assets/images/EGo.png',
                                fit: BoxFit.fill,

                              ),
                            ),
                             SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'E Mini',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: getProportionateScreenWidth(99),
                      height: getProportionateScreenWidth(99),
                      padding: EdgeInsets.all(getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            // changes position of shadow
                          ),
                        ],

                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 4.0,
                                    // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                'assets/images/EGo.png',
                                fit: BoxFit.fill,

                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'E Go',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: getProportionateScreenWidth(99),
                      height: getProportionateScreenWidth(99),
                      padding: EdgeInsets.all(getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            // changes position of shadow
                          ),
                        ],

                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 4.0,
                                    // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                'assets/images/executive.png',
                                fit: BoxFit.fill,

                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'Premium',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),



              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(15),
              horizontal: getProportionateScreenHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: getProportionateScreenWidth(99),
                      height: getProportionateScreenWidth(99),
                      padding: EdgeInsets.all(getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            // changes position of shadow
                          ),
                        ],

                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 4.0,
                                    // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                'assets/images/eauto.png',
                                fit: BoxFit.fill,

                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'Auto',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: getProportionateScreenWidth(99),
                      height: getProportionateScreenWidth(99),
                      padding: EdgeInsets.all(getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            // changes position of shadow
                          ),
                        ],

                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 4.0,
                                    // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                'assets/images/ebike.png',
                                fit: BoxFit.fill,

                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'Bike',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: getProportionateScreenWidth(99),
                      height: getProportionateScreenWidth(99),
                      padding: EdgeInsets.all(getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            // changes position of shadow
                          ),
                        ],

                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 4.0,
                                    // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Image.asset(
                                'assets/images/Emini.png',
                                fit: BoxFit.fill,

                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'City to city',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }
}