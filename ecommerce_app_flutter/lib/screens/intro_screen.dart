import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';
import '../constants/colors.dart';
import '../screens/login_screen.dart';
class IntroScreen extends StatefulWidget {
static const routName = '/IntroScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  int pageCount=0;
  final PageController _controller = PageController();
  void setPageCount(int aPageCount){
    setState(() {
      pageCount= aPageCount;
    });

  }
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            illustrationpageView(_controller, setPageCount),
            TextView(pageCount),
          ],
        ),
      ),
    );
  }
}

class TextView extends StatelessWidget {
  final int pageCount;

  const TextView(this.pageCount);
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'title': 'BTC/USDT',
        'disc':
        'You can Sell Or Purchase BTC Directly Through Ads From Different Persons',
      },
      {
        'title': 'ETH/USDT',
        'disc':
        'You can Sell Or Purchase ETH Directly Through Ads From Different Persons',
      },
      {
        'title': 'BNB/USDT',
        'disc':
        'You can Sell Or Purchase BNB Directly Through Ads From Different Persons',
      },
    ];
    return Expanded(
      flex: 2,
        child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),),
          child: Column(
            children: [
              Spacer(),
              Text(data[pageCount]['title'],
              style: Theme.of(context).textTheme.headline3.copyWith(color: kTextColor,
              fontWeight: FontWeight.w600,
              ),
              ),
              Spacer(),
              Text(data[pageCount]['disc'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextColor,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pageindecator(pageCount, 0),
                  SizedBox(
                    width: getProportionateScreenWidth(8),
                  ),
                  Pageindecator(pageCount, 1),
                  SizedBox(
                    width: getProportionateScreenWidth(8),
                  ),
                  Pageindecator(pageCount, 2),
                ],
              ),
              Spacer(),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routName);
              }, child: Text('Get Started',),
              ),
              Spacer(),
            ],
          ),
        ),
      );
  }
}

class Pageindecator extends StatelessWidget {
  const Pageindecator(this.pageCount, this.index);

  final int pageCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300,),
      width: pageCount == index
          ? getProportionateScreenWidth(32)
          : getProportionateScreenWidth(8),
      height: getProportionateScreenWidth(8),
      decoration: BoxDecoration(
        color: pageCount == index ? kPrimaryGreen : kFillColorPrimary,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(4),
        ),
      ),
    );
  }
}

class illustrationpageView extends StatelessWidget {
  final controller;
  final Function(int) callback;
  const illustrationpageView( this.controller, this.callback) ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
          color: kAccentGreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: getProportionateScreenHeight(50),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routName);
                    },
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.headline4.copyWith(color: kTextColor,
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(20),),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(40),),

                 Expanded(
                   child: PageView(
                      controller:controller,
                      onPageChanged: (PageNum){
                        callback(PageNum);
                      },
                      children: [
                      Image.asset('assets/images/illu1.png'),
                      Image.asset('assets/images/illu2.png'),
                      Image.asset('assets/images/illu3.png'),
                ],),
                 ),
               
              SizedBox(height: getProportionateScreenHeight(20 ),),
            ],
          )),
    );
  }
}
