import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themovers/utils/colors.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),),
              child: Container(
                height: getProportionateScreenWidth(460),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: kTextColor,
                        size: 32,
                      ),
                      title: Text('Profile'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/images/trips_icon.svg',
                        width: 32,
                        color: kTextColor,
                      ),
                      title: Text('Trips'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/images/wallet_app_bar.svg',
                        color: kTextColor,
                        width: 32,
                      ),
                      title: Text('Wallet'),
                      onTap: () {},
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
                        size: 32,
                      ),
                      title: Text('Travel Rates'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_city_outlined,
                        color: kTextColor,
                        size: 32,
                      ),
                      title: Text('Offices'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.live_help_outlined,
                        color: kTextColor,
                        size: 32,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(
                          color: kTextColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                    Divider(),
                    Container(
                      child: Row(
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
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.wallet_giftcard_outlined,
                        color: kTextColor,
                        size: 32,
                      ),
                      title: Text('Reward'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.share_sharp,
                        color: kTextColor,
                        size: 32,
                      ),
                      title: Text('Share'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.star_outline,
                        color: kTextColor,
                        size: 32,
                      ),
                      title: Text(
                        'Give Us Rating',
                        style: TextStyle(
                          color: kTextColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_sharp,
                        size: 32,
                        color: kTextColor,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: kTextColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),

    );
  }
}
