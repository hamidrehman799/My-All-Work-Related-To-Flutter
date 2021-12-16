import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/MapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _numberFocusNode = FocusNode();

  var _initValues = {
    'number': '',
  };
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
            },
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
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(30),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: getProportionateScreenHeight(30),
                          height: getProportionateScreenHeight(100),
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
                            title: Padding(
                              padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(10),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Pickup'),
                              ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
