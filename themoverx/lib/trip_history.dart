import 'package:flutter/material.dart';

class tripHistory extends StatefulWidget {
  const tripHistory({Key key}) : super(key: key);

  @override
  _tripHistoryState createState() => _tripHistoryState();
}

class _tripHistoryState extends State<tripHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(
            //     Icons.arrow_back,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            toolbarHeight: 140,
            bottom: const TabBar(
              labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "Comleted",
                ),
                Tab(text: "In Comleted")

                //  Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            title: Center(
                child: const Text(
              'History',
              style: TextStyle(fontSize: 60),
            )),
          ),
          body: const TabBarView(
            children: [
              Center(
                  child: Text(
                "No Data Found",
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
              Center(
                  child: Text(
                "No Data Found",
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
