
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import './map_screen.dart';
class AddAddressScreen extends StatelessWidget {

  static const routName='/add_address_screen';

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonLS(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
              ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Add New Address',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context) .pushNamed(MapScreen.routName);
                          },
                            child: Image.asset('assets/Images/map.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Row(
                      children: [
                        FittedBox(
                          child: Text('You Will Find Grocery Near Your Home',
                          style: TextStyle(color: kTextColorAccent,
                          fontSize: getProportionateScreenWidth(17),
                          ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    SearchBar(),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Divider(),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Expanded(
                      flex: 5,
                      child: ListTile(
                        title: Text(
                          'Current Location',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          'Planet Earth Lahore Barket Market',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(8),
                              ),

                            ),
                             color: kPrimaryGreen,
                          ),
                          child:Padding(
                            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: getProportionateScreenWidth(28),
                              color: Colors.white,
                            ),
                          ),
                        ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: kFillColorThird,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(4),
        ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintText: 'Enter Address',
        contentPadding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(
            10,
        ),
        ),
        hintStyle: TextStyle(
          color: kGreyShade2,
          fontSize: getProportionateScreenWidth(17),
        ),
      ),
    );
  }
}
