import 'package:themoverx/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as loc;

import 'package:geolocator/geolocator.dart';

import 'news/new2.dart';

class Googlemaap extends StatefulWidget {
  Googlemaap({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<Googlemaap> createState() => _GooglemaapState();
}

double height;
double width;
final _controllpick = TextEditingController();
final _controlldrop = TextEditingController();
bool showpick = true;
bool showdrop = false;
bool showgoogleMap = true;

class _GooglemaapState extends State<Googlemaap> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  loc.Location _location = loc.Location();
  String pickuplocaation = "";

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(); //desiredAccuracy: LocationAccuracy.high
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    setState(() {
      _initialcameraposition = LatLng(position.latitude, position.longitude);
      pickuplocaation = first.addressLine;
    });
    print("${first.featureName} : ${first.addressLine}" +
        "ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp");
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialcameraposition, zoom: 16),
                mapType: MapType.normal,
                scrollGesturesEnabled: true,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
              ),
            ],
          ),
        ),
        Visibility(
          child: Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(0, 450, 2, 0),
            height: 150,
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
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 2, left: 1, right: 1),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            populars[index].image,
                            height: 90,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            populars[index].country,
                            style: TextStyle(
                                fontSize: 16,
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
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            // ),
            child: Column(
              children: [
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: pickuplocaation,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: showgoogleMap,
          child: Container(
            margin: EdgeInsets.only(top: 200),
            height: 200,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(10.0, 10.0),
                  )
                ]),
            child: Stack(
              children: [
                Visibility(
                  visible: showpick,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 3, left: 2, right: 2),
                        child: Text("Confirm your location ?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 2,
                          left: 3,
                          right: 3,
                        ),
                        child: TextField(
                          controller: _controllpick,
                          onTap: () async {
                            Prediction p = await PlacesAutocomplete.show(
                                context: context,
                                radius: 10000000,
                                types: [],
                                strictbounds: false,
                                mode: Mode.overlay,
                                language: "en",
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                components: [
                                  new Component(Component.country, "pk")
                                ]);
                            if (p != null) {
                              _getLatLngPick(p);
                            } else {
                              print("bye");
                            }
                          },
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: pickuplocaation,
                            /*labelText: "Pick Up",*/

                            // prefixIcon: Image.asset(
                            //   "assets/images/ic_pin.png",
                            //   height: height * 0.05,
                            // ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showpick = false;
                              showdrop = true;
                            });
                          },
                          child: Text(
                            "Confirm Pickup",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: showdrop,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 3, left: 2, right: 2),
                        child: Text("Where you want to go...",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 1, right: 1),
                        child: TextField(
                          controller: _controlldrop,
                          onTap: () async {
                            Prediction p = await PlacesAutocomplete.show(
                                context: context,
                                types: [],
                                mode: Mode.overlay,
                                apiKey:
                                    "AIzaSyBKEbxu1TpyVgw6ZgncDkjy1Cy-bEM6Ch4",
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                components: [
                                  new Component(Component.country, "pk")
                                ]);
                            setState(() {
                              print(
                                  "---------============-------======================================================================");

                              if (p != null) {
                                _getLatLngdrop(p);
                                print(
                                    "------------------------------------------------------------------------------------------------------");
                              } else {
                                print(
                                    "ggggggggggggggggggggjjjjjjjjjjjsAJkdaaaadshzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzj");
                              }
                            });
                          },
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: globals.droop_address,

                            /*labelText: "Pick Up",*/

                            // prefixIcon: Image.asset(
                            //   "assets/images/current_location.png",
                            //   height: height * 0.05,
                            // ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: ElevatedButton(
                          onPressed: () {
                            goto();
                            //   get_dateNtime();
                          },
                          child: Text(
                            "Confirm Drop Off",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1),
                        child: ElevatedButton(
                          onPressed: () {
                            // get_dateNtime();
                            setState(() {
                              //  get_dateNtime();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Gp_w_destination()),
                              // );
                            });
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }

  void _getLatLngPick(Prediction prediction) async {
    GoogleMapsPlaces _places = new GoogleMapsPlaces();
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(prediction.placeId);
    double latitude = detail.result.geometry.location.lat;
    double longitude = detail.result.geometry.location.lng;
    String address = prediction.description;
    setState(() {
      globals.pick_address = address;
      globals.pick_lat = latitude;
      globals.pick_log = longitude;
    });
  }

  void _getLatLngdrop(Prediction prediction) async {
    GoogleMapsPlaces _places = new GoogleMapsPlaces(); //Same API_KEY as above
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(prediction.placeId);
    double latitude = detail.result.geometry.location.lat;
    double longitude = detail.result.geometry.location.lng;
    String address = prediction.description;

    setState(() {
      globals.droop_address = address;
      globals.droop_lat = latitude;
      globals.droop_log = longitude;
    });
  }
}

void goto() {
  if (globals.droop_address != null) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Gp_dsi_mark()),
    // );
  } else {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Gp_w_destination()),
    // );
  }
}
