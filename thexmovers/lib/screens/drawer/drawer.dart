import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thexmovers/utils/colors.dart';
import 'package:thexmovers/utils/screen_utils.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 25),
            width: double.infinity,
            color: kPrimaryblue,
            child: Center(
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

          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text('Booking'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Transection'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.wallet_membership),
            title: Text('Wallet'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.travel_explore_rounded),
            title: Text('Travel Rates'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {},
          ),
          Expanded(child: Container()),
          ListTile(
            leading: Icon(Icons.logout_sharp),
            title: Text(
              'LogOut',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
