import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:themovers/assistants/assistantmethods.dart';
import 'package:themovers/providor/eminidata.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/MapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


double bottomPaddingMap = 0;

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  Position currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlngposition = LatLng(position.latitude,position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latlngposition, zoom: 16.8);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String address = await AssistantMethod.searchCoordinateAddress(position, context);
    print("your address:=" + address);
  }
  static final CameraPosition _lahore = CameraPosition(
    target: LatLng(31.5204, 74.3587),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _lahore,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
              setState(() {
                bottomPaddingMap= getProportionateScreenHeight(200);
              }

              );
              locatePosition();

            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(12),
              vertical: getProportionateScreenHeight(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(

                  width: getProportionateScreenHeight(40),
                  height: getProportionateScreenHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kPrimaryblue,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: kTextColorForth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: getProportionateScreenHeight(345),
              decoration: BoxDecoration(
                color: kTextColorForth,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    spreadRadius: .1,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(60),
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        color: kPrimaryblue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trip',
                          style: TextStyle(
                            fontSize: 18,
                            color: kTextColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(
                              fontSize: 18,
                              color: kSecondaryblue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(30),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: getProportionateScreenHeight(30),
                            height: getProportionateScreenHeight(105),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/pickicon.svg',
                                  height: 90,

                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenHeight(20),
                            ),
                            child: ListTile(
                              title: Text(
                                Provider.of<AppData>(context).pickUpLocation !=null
                                    ? Provider.of<AppData>(context).pickUpLocation.userplaceName
                                    :"Add Adress",
                              ),
                              subtitle: TextFormField(
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Drop Off'),
                              ),
                            ),
                          ),



                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: getProportionateScreenHeight(30),
                                  height: getProportionateScreenHeight(180),
                                  child: SvgPicture.asset(
                                    'assets/images/sort-swap-svgrepo-com 1.svg',
                                    height: 90,

                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          child: SizedBox(
                            width: getProportionateScreenWidth(160),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        kPrimaryblue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  getProportionateScreenWidth(15),
                                ),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kTextColorForth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: getProportionateScreenHeight(10),
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
