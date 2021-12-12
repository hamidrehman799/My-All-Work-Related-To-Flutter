import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovers/utils/screen_utils.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ScreenUtils().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: getProportionateScreenHeight(300),
            height:getProportionateScreenHeight(300),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Text(title,
              style: GoogleFonts.roboto(
                  fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(
            height: getProportionateScreenHeight(3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16),),
            child: Text(
              description,
              style: GoogleFonts.roboto(
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.7,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }
}
