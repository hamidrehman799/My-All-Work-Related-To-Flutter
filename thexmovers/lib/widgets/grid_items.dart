import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thexmovers/utils/colors.dart';

class GridItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Color color;

  GridItems(
    this.id,
    this.color,
    this.imageUrl,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 100,
            height: 100,
            child: GridTile(
              child: Image.asset(
                imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.fill,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              color: color,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: color,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
    );
  }
}
