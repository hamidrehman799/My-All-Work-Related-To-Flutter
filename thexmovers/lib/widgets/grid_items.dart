import 'package:flutter/material.dart';


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
            width: 100,
            child: GridTile(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5
              ),
              color: color,
            ),
          ),

        ],
    );
  }
}
