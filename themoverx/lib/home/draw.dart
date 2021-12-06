import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoverx/Mywallet.dart';
import 'package:themoverx/contactUs.dart';
import 'package:themoverx/google.dart';
import 'package:themoverx/googlemaap.dart';
import 'package:themoverx/home/carousel_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:themoverx/home/homescreen.dart';
import 'package:themoverx/home/popular_destination_model.dart';
import 'package:themoverx/Setting/setting.dart';
import 'package:themoverx/login&signup/register.dart';
import 'package:themoverx/news/new1.dart';
import 'package:themoverx/trip_history.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Homesreen(),
    Mywallet(),
    Setting(),
  ];
  void OnTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        iconTheme: IconThemeData(color: Colors.blue),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "The themoverx",
            style: GoogleFonts.roboto(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
        elevation: 0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //Header
            new UserAccountsDrawerHeader(
              accountName: Text(
                'Adeel Ashraf',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
              ),
              accountEmail: Text(
                '0313-7388266',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
              ),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            //body
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new tripHistory()));
              },
              child: ListTile(
                title: Text(
                  'Your Trip',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.travel_explore,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Googlemaap()));
              },
              child: ListTile(
                title: Text(
                  'City to city',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.location_city_sharp,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new bottom()));
              },
              child: ListTile(
                title: Text(
                  'My seat',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.chair_alt_sharp,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Mywallet()));
              },
              child: ListTile(
                title: Text(
                  'My Wallet',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.payment,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Contactus()));
              },
              child: ListTile(
                title: Text(
                  'Contact us',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              height: 64,
              thickness: 0.5,
              color: Colors.black.withOpacity(0.3),
              indent: 32,
              endIndent: 32,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Register()));
              },
              child: ListTile(
                title: Text(
                  'Logout',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFAFAFA),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        //iconSize: 20,
        //  selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text(
                "",
                style: GoogleFonts.roboto(color: Colors.white),
              )),

          //BottomNavigationBarItem(icon: Icon(Icons.local_hospital, size: 40,), title: Text("Challenges", style: TextStyle(color: Colors.white),)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet_travel,
                size: 30,
              ),
              title: Text(
                "",
                style: GoogleFonts.roboto(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text(
                "",
                style: GoogleFonts.roboto(color: Colors.white),
              )),
        ],
        onTap: OnTappedBar,
        currentIndex: _currentIndex,
      ),
    );
  }
}
