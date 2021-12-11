import 'package:flutter/material.dart';
import 'package:thexmovers/utils/colors.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryblue,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            color: kPrimaryblue,
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
                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/EGo.png',
                              fit: BoxFit.fill,
                              width: 60,
                              height: 60,
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
                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/EGo.png',
                              fit: BoxFit.fill,
                              width: 60,
                              height: 60,
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
                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/executive.png',
                              fit: BoxFit.fill,
                              width: 60,
                              height: 60,
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
            color: kPrimaryblue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/eauto.png',
                              fit: BoxFit.fill,
                              width: 60,
                              height: 60,
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
                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/ebike.png',
                              fit: BoxFit.fill,
                              width: 60,
                              height: 60,
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
                        borderRadius: BorderRadius.circular(5),
                        color: kTextColorForth,

                      ),
                      width: 107,
                      height: 107,
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/executive.png',
                              fit: BoxFit.fill,
                              width: 60,
                              height: 60,
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