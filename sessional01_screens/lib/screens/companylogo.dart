import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Row(
          children: <Widget>[


                Text('Chat',
                style: TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'PlayBall',
              ),
              ),


          ],

    ),


      ],
    );
  }

}