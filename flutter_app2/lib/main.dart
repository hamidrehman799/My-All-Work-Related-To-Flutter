import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Icon(Icons.menu),
            title: Center(
              child: Text(
                "Hi! Ummaah",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              Icon(
                Icons.search,
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
                height: 250,
                color: Colors.blue,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ring_volume_rounded,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "1 new Massage",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "../images/ghj.jpg",
                                  height: 100.0,
                                  width: 100.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Hy How Re you did You See This",
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "You see The Latest ",
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(child: (
              Row(
                children: [


                ],
              )
              ),),
              Container(
                color: Colors.black,
                height: 60.0,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "Recenet Chat",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "../images/hj.jpg",
                          height: 100.0,
                          width: 100.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Rachoor Das",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "I Am on my way",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 200.0,
                        ),
                        Text(
                          "5 Mint Ago",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "../images/jkl.jpg",
                          height: 100.0,
                          width: 100.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Michel Shelton",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Vedio Chat",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 200.0,
                        ),
                        Text(
                          "2 Days Ago",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        ));
  }
}
