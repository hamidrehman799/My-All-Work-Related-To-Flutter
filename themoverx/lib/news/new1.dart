import 'package:flutter/material.dart';

import 'new2.dart';

class bottom extends StatefulWidget {
  const bottom({Key key}) : super(key: key);

  @override
  _bottomState createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 420, 5, 10),
        height: 240,
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
                height: 200,
                width: 200,
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
                        height: 170,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        populars[index].country,
                        style: TextStyle(
                            fontSize: 25,
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
    );
  }
}
