import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';
import 'package:themovers/screens/drawer/drawer.dart';
import 'package:themovers/widgets/homegrid.dart';
import 'package:themovers/widgets/card_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      key: scaffoldkey,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: kPrimaryblue,
        leading:  Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
              onPressed: () {
                scaffoldkey.currentState.openDrawer();
              },
              icon: SvgPicture.asset('assets/images/gg_menu-left.svg',
              ),
            ),
        ),
          actions: <Widget>[
      Padding(
      padding: EdgeInsets.only(right: 10.0),
        child: IconButton(
          onPressed: () {

          },
          icon: SvgPicture.asset('assets/images/wallet_app_bar.svg',
            width: 30,
            height: 30,
          ),
        ),
    ),
  ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryblue,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(

                    horizontal: getProportionateScreenWidth(10.0),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Welcome',
                          style: TextStyle(
                            color: kTextColorForth,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Hamid Rehman',
                          style: TextStyle(
                            color: kTextColorForth,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HomeGrid(),
              ],
            ),
          ),

          CardandSlider(),
        ],
      ),
    );
  }
}
