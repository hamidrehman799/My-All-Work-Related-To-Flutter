/*import 'dart:html';*/

/*import 'dart:html';*/

import 'package:flutter/material.dart';
import 'package:themoverx/globals.dart' as globals;
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_webservice/directions.dart' as webpoly;
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/staticmap.dart';
import 'package:google_maps_webservice/timezone.dart';
import 'package:intl/intl.dart';

class gooleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainMap();
  }
}

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
    application_bloc();
    polylinePoints = PolylinePoints();
  }

  final _controllpick = TextEditingController();
  final _controlldrop = TextEditingController();

  double height;
  double width;

  GoogleMapController _controller;
  double a = globals.lat;
  double b = globals.log;
  double _originLatitude = globals.pick_lat;
  double _originLongitude = globals.pick_log;
  double _destLatitude = globals.droop_lat;
  double _destLongitude = globals.droop_log;
  double x;
  double y;
  bool showpick = true;
  bool showdrop = false;
  bool showgoogleMap = true;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/current_location.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    //setPolyLines();
    setState(() {
      /*_markers.addAll(list);*/
      _markers.add(
        Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(a, b),
            icon: mapMarker),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    final CameraPosition _initialPosition =
        CameraPosition(target: LatLng(a, b), zoom: 20);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                mapType: MapType.normal,
                polylines: _polylines,
                scrollGesturesEnabled: true,
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                markers: /*Set<Marker>.of(list),*/ _markers,
              ),
            ),
            Visibility(
              visible: showgoogleMap,
              child: Container(
                margin: EdgeInsets.only(top: height * 0.6),
                height: height * 0.4,
                width: width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
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
                            margin: EdgeInsets.only(
                                top: height * 0.04,
                                left: width * 0.03,
                                right: width * 0.03),
                            child: Text("Confirm your location ?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: height * 0.04,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: height * 0.05,
                                left: width * 0.03,
                                right: width * 0.03),
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
                                hintText: globals.pick_address,
                                /*labelText: "Pick Up",*/

                                prefixIcon: Image.asset(
                                  "assets/images/ic_pin.png",
                                  height: height * 0.05,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.04),
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
                                  fontSize: height * 0.03,
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
                            margin: EdgeInsets.only(
                                top: height * 0.04,
                                left: width * 0.03,
                                right: width * 0.03),
                            child: Text("Where you want to go...",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: height * 0.04,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: height * 0.05,
                                left: width * 0.03,
                                right: width * 0.03),
                            child: TextField(
                              controller: _controlldrop,
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
                                  _getLatLngdrop(p);
                                } else {
                                  print("bye");
                                }
                              },
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: globals.droop_address,
                                /*labelText: "Pick Up",*/

                                prefixIcon: Image.asset(
                                  "assets/images/current_location.png",
                                  height: height * 0.05,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.04),
                            child: ElevatedButton(
                              onPressed: () {
                                goto();
                                //   get_dateNtime();
                              },
                              child: Text(
                                "Confirm Drop Off",
                                style: TextStyle(
                                  fontSize: height * 0.03,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.01),
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
                                  fontSize: height * 0.03,
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
          ],
        ),
      ),
    );
  }

  Future<void> application_bloc() async {
    loc.Location location = new loc.Location();

    loc.LocationData _locationData;

    _locationData = await location.getLocation();

    setState(() async {
      x = _locationData.latitude.toDouble();
      y = _locationData.longitude.toDouble();
      globals.pick_lat = x;
      globals.pick_log = y;
      final coordinates = new Coordinates(x, y);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      print("${first.addressLine}");

      setState(() {
        globals.pick_address = first.addressLine.toString();
      });
    });
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

  // void setPolyLines() async{
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       PointLatLng(_originLatitude, _originLongitude),
  //       PointLatLng(_destLatitude, _destLongitude)
  //   );
  //   if(result.status == 'ok'){
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //     setState(() {
  //       _polylines.add(
  //         Polyline(
  //           width: 10,
  //           polylineId: PolylineId('polyLine'),
  //           color: Colors.blue[700],
  //           points: polylineCoordinates
  //         )
  //       );
  //     });
  //   }
  // }
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
  // void get_dateNtime() {
  //   DateTime dt = new DateTime.now();
  //   String fx = DateFormat.yMEd().add_jms().format(dt);
  //   setState(() {
  //     globals.time = fx;
  //   });
  // }
}
