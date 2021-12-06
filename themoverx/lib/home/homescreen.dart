import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoverx/googlemaap.dart';
import 'package:themoverx/home/carousel_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:themoverx/home/popular_destination_model.dart';

class Homesreen extends StatefulWidget {
  const Homesreen({Key key}) : super(key: key);

  @override
  _HomesreenState createState() => _HomesreenState();
}

class _HomesreenState extends State<Homesreen> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 27, bottom: 24),
                child: Text(
                  'Hi, Adeel 👋 Welcome the The themoverx',
                  style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        child: Swiper(
                          onIndexChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          autoplay: true,
                          layout: SwiperLayout.DEFAULT,
                          itemCount: carousels.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                      carousels[index].image,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: map<Widget>(
                            carousels,
                            (index, image) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                height: 6,
                                width: 6,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Colors.blue
                                        : Colors.blue),
                              );
                            },
                          ),
                        ),
                        // More
                        Text('More...',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.blue))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
                child: Text(
                  'Let\'s Go!',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 160,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Googlemaap()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.only(left: 10),
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/Emini.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'E Mini',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Googlemaap()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.only(left: 10),
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/EGo.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'E GO ',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Googlemaap()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.only(left: 1),
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/executive.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'E Executive',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Colors.blue),
                                        ),
                                        // Text(
                                        //   'Let\'s take a break',
                                        //   style: mServiceSubtitleStyle,
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Googlemaap()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.only(left: 1),
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/city_to_city.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'City To City',
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        // Text(
                                        //   'Around the city',
                                        //   style: mServiceSubtitleStyle,
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Googlemaap()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.only(left: 10),
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/eauto.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'E Auto',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.blue),
                                        ),
                                        // Text(
                                        //   'Feel freedom',
                                        //   style: mServiceSubtitleStyle,
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Googlemaap()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.only(left: 10),
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/ebike.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'E Bike ',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.blue),
                                        ),
                                        // Text(
                                        //   'Intercity',
                                        //   style: mServiceSubtitleStyle,
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 1, bottom: 12),
                child: Text(
                  'Popular Destinations!',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  itemCount: populars.length,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 140,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                populars[index].image,
                                height: 74,
                              ),
                              // Text(
                              //   populars[index].name,
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w900,
                              //       color: Colors.blue),
                              // ),
                              SizedBox(height: 10),
                              Text(
                                populars[index].country,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: Container(
                  height: 230.0,
                  width: 370.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(25.0, 10.0, 230.0, 10.0),
                        child: Text(
                          "Book a Ride",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25.0, 10.0, 150.0, 10.0),
                        child: Text(
                          "Your Current location ",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 100.0, 5.0),
                        child: Text(
                          "Where do you went to go? ",
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                              height: 50.0,
                              width: 120.0,
                              child: Center(
                                child: Text(
                                  "Location Name",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1.0, 1.0))
                                  ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                              height: 50.0,
                              width: 120.0,
                              child: Center(
                                child: Text(
                                  "Location Name",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1.0, 1.0))
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(1.0, 1.0))
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
