import 'package:flutter/material.dart';
import 'package:themovers/screens/user_profile.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../history_screen.dart';
import '../wallet_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: kPrimaryblue,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryblue,
                ),
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
                    Text(
                      'Hamid',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Expanded(
                child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Profile', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(ProfileScreen.routeName);
                        },
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/trips_icon.svg',
                          width: 30,
                          color: kTextColor,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Trips', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(HistoryScreen.routeName);
                        },
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/wallet_app_bar.svg',
                          color: kTextColor,
                          width: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Wallet', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(WalletScreen.routeName);

                        },
                      ),
                      Divider(),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 0, 10),
                              child: Text(
                                'Support',
                                style: TextStyle(
                                  color: kGreyShade1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.payments_outlined,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Travel Rates', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_city_outlined,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Offices', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.live_help_outlined,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Help', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                      Divider(),
                      Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 0, 10),
                              child: Text(
                                'Others',
                                style: TextStyle(
                                  color: kGreyShade1,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ListTile(
                        leading: Icon(
                          Icons.wallet_giftcard_outlined,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Reward', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.share_sharp,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Share', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.star_outline,
                          color: kTextColor,
                          size: 30,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Give us Rating', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout_sharp,
                          size: 30,
                          color: kTextColor,
                        ),
                        title: Padding(
                          padding:  EdgeInsets.only(top: getProportionateScreenHeight(5),),
                          child: Text('Logout', style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),



          ],
        ),

    );
  }
}
