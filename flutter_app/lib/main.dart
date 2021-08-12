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
              "Profile",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [Icon(Icons.settings)],
        ),
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("../images/ij.jpg"),
                      height: 350.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Text(
                          "Ummama Noor",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Setti",
                          style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 3.0,
                            color: Colors.black,
                          ),
                        ),

                      ],
                      
                      
                    ),
                  )
                  
                ],
              ),
              
            ),
            Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blueAccent,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Event Manager",
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "San Fransico",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "145K",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Follwors",
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 3.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "56K",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 3.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "1,690",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Likes",
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 3.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white10,
          notchMargin: 2.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.sms),
              Icon(Icons.call),
              Icon(Icons.camera_alt),
            ],
          ),
        ),
      ),
    );
  }
}
