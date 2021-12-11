import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thexmovers/utils/colors.dart';
import 'package:thexmovers/utils/screen_utils.dart';
import 'package:thexmovers/screens/drawer/drawer.dart';
import 'package:thexmovers/widgets/homegrid.dart';
import 'package:thexmovers/widgets/card_slider.dart';
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
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: IconButton(
              onPressed: () {
                scaffoldkey.currentState.openDrawer();
              },
              icon: SvgPicture.asset('assets/images/gg_menu-left.svg',
                width: 40,
                height: 40,
              ),
            ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
            color: kPrimaryblue,
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
          CardandSlider(),
        ],
      ),
    );
  }
}
