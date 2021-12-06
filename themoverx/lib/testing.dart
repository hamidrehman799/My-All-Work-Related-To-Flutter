import 'package:geocoding/geocoding.dart';
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

class Googlemaapt extends StatefulWidget {
  Googlemaapt({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<Googlemaapt> createState() => _GooglemaaptState();
}

double height;
double width;
final _controllpick = TextEditingController();
final _controlldrop = TextEditingController();
bool showpick = true;
bool showdrop = false;
bool showgoogleMap = true;

class _GooglemaaptState extends State<Googlemaapt> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  String searchAdd;
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
            margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
            height: MediaQuery.of(context).size.height * 0.2,
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
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Positioned(
                      top: 60,
                      right: 15,
                      left: 15,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Address',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 15,
                              top: 15,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: searchnavigate,
                              iconSize: 30,
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              searchAdd = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }

  searchnavigate() {
    locationFromAddress(searchAdd).then((result) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10,
      )));
    });
  }

  void onMapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  // searchandNavigate() {
  //   Geolocator().placemarkFromCoordinates(searchAdd).then((result) {
  //     _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //         target:
  //             LatLng(result[0].position.latitude, result[0].position.longitude),
  //         zoom: 10.0)));
  //   });
  // }
}
