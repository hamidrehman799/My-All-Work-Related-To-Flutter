
import 'package:ecommerce_app_flutter/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';
class HomeScreen extends StatelessWidget {


  static const routName='/home_screen';
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:   getProportionateScreenWidth(
                    16,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Here Will Be Address',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                            'Full Address About with Street',
                          style: TextStyle(
                            color: kTextColorAccent,
                            fontSize: getProportionateScreenWidth(12,),
                          ),

                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: kPrimaryGreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
