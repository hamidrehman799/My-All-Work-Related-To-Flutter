import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';
import '../constants/colors.dart';
import 'package:ecommerce_app_flutter/models/category.dart';
class HomeScreen extends StatelessWidget {


  static const routName='/home_screen';
  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        'Vegetables',
        'assets/images/vegetable_home.png',
        kAccentGreen,
      ),
      Category(
        'Fruits',
        'assets/images/fruit_home.png',
        kAccentRed,
      ),
      Category(
        'Milks & Egg',
        'assets/images/egg_home.png',
        kAccentYellow,
      ),
      Category(
        'Meat',
        'assets/images/meat_home.png',
        kAccentPurple,
      ),
    ];
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            HomeAppBar(),
            Spacer(),
            CategoryTab(categories: categories),
            Spacer(),
            DealsTab(),
            Spacer(),
            PopularDealTab()
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );

  }
}

class PopularDealTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Popular Deals',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: getProportionateScreenWidth(8),
              ),
              children: [
                IndiDealCard(
                  isLeft: true,
                  isSelected: true,
                ),
                IndiDealCard(
                  isLeft: false,
                  isSelected: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: kPrimaryGreen,
      unselectedItemColor: kGreyShade2,
      currentIndex: 0,
      showSelectedLabels: true,
      items: [
        BottomNavigationBarItem(
        icon: Image.asset(
            'assets/images/home_nav.png',
        ),
        label: 'Home',
      ),
        BottomNavigationBarItem(

          icon: Image.asset(
              'assets/images/star_nav.png',
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
              'assets/images/cart_nav.png',
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
              'assets/images/user_nav.png',
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

class IndiDealCard extends StatelessWidget {
  final bool isLeft;
  final bool isSelected;

  const IndiDealCard({this.isLeft, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isLeft ? getProportionateScreenWidth(16.0) : 0,
        right: isLeft ? 0 : getProportionateScreenWidth(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8.0),
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(
              8,
            ),
          ),
          boxShadow: [
            isSelected
                ? BoxShadow(
              color: kShadowColor,
              offset: Offset(
                getProportionateScreenWidth(24),
                getProportionateScreenWidth(40),
              ),
              blurRadius: 80,
            )
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kGreyShade5,
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BTC/ETH',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColorAccent,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$45000',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: kPrimaryGreen,
                        constraints: BoxConstraints.tightFor(
                          width: getProportionateScreenWidth(
                            40,
                          ),
                          height: getProportionateScreenWidth(
                            40,
                          ),
                        ),
                        elevation: 0,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DealsTab extends StatelessWidget {
  const DealsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              16,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Here is Deal For you',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DealCard(),
              DealCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class DealCard extends StatelessWidget {
  const DealCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: getProportionateScreenWidth(280),
      height: getProportionateScreenHeight(170),
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(16),
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(
              8,
            ),
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            kGradientColor,
            kGradientColor.withOpacity(0),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fresh Fruit for You',
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Fresh fruit Everyday we Serve to You',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              TextButton(
                onPressed: () {
                  /// TODO: add routes
                },
                child: Text(
                  'See All',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              categories.length,
                  (index) => CategoryCard(categories[index]),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard(
      this.category,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: getProportionateScreenWidth(24),
          backgroundColor: category.color,
          child: SizedBox(
            width: getProportionateScreenWidth(28),
            child: Image.asset(
              category.catIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(category.catName)
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
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
                  'I Will Do My Best To Make This App Better',
                  style: TextStyle(
                    color: kTextColorAccent,
                    fontSize: getProportionateScreenWidth(
                      12,
                    ),
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
    );
  }
}