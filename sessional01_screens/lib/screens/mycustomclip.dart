import 'package:flutter/material.dart';
 class MyCustomClipper extends CustomClipper<Path> {
   @override
   Path getClip(Size size){
     double height = size.height;
     double width = size.width;

     Path path = Path()..moveTo(0, 0)..lineTo(0, 0 + height - 10)..quadraticBezierTo(0 + width/2, 0 + height, 0 + width, 0 + height - 10)
     ..lineTo(0 + width, 0)
     ..close();
     return path;
   }

  @override
   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}