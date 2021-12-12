import 'package:flutter/material.dart';
import 'package:thexmovers/utils/colors.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: kPrimaryblue,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(2.0, 0.0),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'E Mini',
                              style: TextStyle(
                                color: kTextColor,
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
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(2.0, 0.0),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'E Go',
                              style: TextStyle(
                                color: kTextColor,
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
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(2.0, 0.0),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Premium',
                              style: TextStyle(
                                color: kTextColor,
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
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
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
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(2.0, 0.0),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Auto',
                              style: TextStyle(
                                color: kTextColor,
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
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(2.0, 0.0),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bike',
                              style: TextStyle(
                                color: kTextColor,
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
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(2.0, 0.0),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'City to city',
                              style: TextStyle(
                                color: kTextColor,
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