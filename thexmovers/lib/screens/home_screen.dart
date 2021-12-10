import 'package:flutter/material.dart';
import 'package:thexmovers/utils/colors.dart';
import 'package:thexmovers/utils/screen_utils.dart';
import 'package:thexmovers/screens/drawer/drawer.dart';
import '../models/slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../models/home_grid_modle.dart';
import '../widgets/grid_items.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryblue,
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB( 15,0,0,0),
            color: kPrimaryblue,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Welcome',
                    style: TextStyle(
                      color: kTextColorForth,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Hamid Rehman',
                    style: TextStyle(
                      color: kTextColorForth,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Grid(),
          CardandSlider(),
        ],
      ),
    );
  }
}

class CardandSlider extends StatefulWidget {
  @override
  State<CardandSlider> createState() => _CardandSliderState();
}

class _CardandSliderState extends State<CardandSlider> {

  List<T> map<T>(List list, Function handler) {

    List<T> result = [];
    for (var j = 0; j < list.length; j++) {
      result.add(handler(j, list[j]));
    }
    return result;
  }
int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Recent Routes:',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Card(),
            Card(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Promotions:',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Swiper(
                          onIndexChanged: (d) {
                            setState(() {
                              _current = d;
                            });
                          },
                          autoplay: true,
                          layout: SwiperLayout.DEFAULT,
                          itemCount: carousels.length,
                          itemBuilder: (BuildContext context, d) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                      carousels[d].image,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        )),
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

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kFillColorAccent,
        ),
        height: getProportionateScreenHeight(70),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0)),
                  color: kPrimaryblue,
                ),
                height: getProportionateScreenHeight(100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1',
                      style: TextStyle(
                        color: kFillColorPrimary,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text('From'),
                subtitle: Text('Punjab Socity...'),
              ),
            ),
            const Icon(
              Icons.arrow_right_alt_outlined,
              size: 16.0,
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text('To'),
                subtitle: Text('Punjab Socity...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  final List<GridModle> loadedgrid = [
    GridModle(
      id: '1',
      title: 'E Mini',
      imageUrl: 'assets/images/ebike.png',
      color: kTextColorForth,
    ),
    GridModle(
      id: '2',
      title: 'E Go',
      imageUrl: 'assets/images/eauto.png',
      color: kTextColorForth,
    ),
    GridModle(
      id: '3',
      title: 'Premium',
      imageUrl: 'assets/images/executive.png',
      color: kTextColorForth,
    ),
    GridModle(
      id: '4',
      title: 'Auto',
      imageUrl: 'assets/images/Emini.png',
      color: kTextColorForth,
    ),
    GridModle(
      id: '5',
      color: kTextColorForth,
      imageUrl: 'assets/images/EGo.png',
      title: 'Bike',
    ),
    GridModle(
      id: '6',
      title: 'City to city',
      imageUrl: 'assets/images/EGo.png',
      color: kTextColorForth,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20,10,20,0),
      height: 250,
      color: kPrimaryblue,
      child: GridView.builder(
        itemCount: loadedgrid.length,
        itemBuilder: (ctx, i)=> GridItems(loadedgrid[i].id, loadedgrid[i].color, loadedgrid[i].imageUrl, loadedgrid[i].title),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
