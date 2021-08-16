
import 'package:ecommerce_app_flutter/constants/colors.dart';
import 'package:ecommerce_app_flutter/widgets/back_button_ls.dart';
import 'package:ecommerce_app_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';
class MapScreen extends StatelessWidget {



  static const routName='/mapScreen';
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonLS(),
                Text('Choose Your Address',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(17),
                  fontWeight: FontWeight.w600,
                ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(32),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                        'assets/Images/map_pattrens.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 100,
                      right: 0,
                      child: Image.asset(
                          'assets/Images/curLoc.png',
                      ),
                  ),

                  BottomCard(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(55),
                height: getProportionateScreenWidth(55),
                child: FloatingActionButton(

                  onPressed: () {},
                  child: Icon(
                    Icons.gps_fixed,
                    size: getProportionateScreenWidth(32),
                  ),
                  backgroundColor: kPrimaryGreen,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only
                  (
                  topLeft: Radius.circular
                  (
                  getProportionateScreenWidth(
                    8,
                  ),
                ),
                  topRight: Radius.circular
                    (
                    getProportionateScreenWidth(
                      8,
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                            'Planet Names 989',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Icon(
                            Icons.search,
                          size: getProportionateScreenWidth(32),
                        ),
                      ],

                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Text(
                        'Barkat Market Lahore',
                      style:
                      Theme.of(context).textTheme.headline4.copyWith(
                        color: kTextColorAccent,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Text(
                      'Detail Address',
                      style:
                      Theme.of(context).textTheme.headline4.copyWith(
                        color: kTextColorAccent,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(5),
                    ),
                    CustomTextField(
                      hint: 'Write Down The Building, Apartment or Office...',
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    ElevatedButton(onPressed: (){},
                      child: Text
                        (
                        'Add Address',

                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
