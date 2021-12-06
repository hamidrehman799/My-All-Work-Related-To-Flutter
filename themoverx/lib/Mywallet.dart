import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Mywallet extends StatefulWidget {
  @override
  _MywalletState createState() => _MywalletState();
}

class _MywalletState extends State<Mywallet> {
  List<Color> _backgroundColor;
  Color _iconColor;
  Color _textColor;
  List<Color> _actionContainerColor;
  Color _borderContainer;
  bool colorSwitched = false;
  var logoImage;

  void changeTheme() async {
    if (colorSwitched) {
      setState(() {
        logoImage = 'assets/images/wallet_logo.png';
        _backgroundColor = [
          Colors.blue,
          Colors.blue,
          Colors.blue,
          Colors.blue,
        ];
        _iconColor = Colors.white;
        _textColor = Colors.blue;
        _borderContainer = Color.fromRGBO(34, 58, 90, 0.2);
        _actionContainerColor = [
          Color.fromRGBO(47, 75, 110, 1),
          Color.fromRGBO(43, 71, 105, 1),
          Color.fromRGBO(39, 64, 97, 1),
          Color.fromRGBO(34, 58, 90, 1),
        ];
      });
    } else {
      setState(() {
        logoImage = 'assets/images/wallet_logo.png';
        _borderContainer = Color.fromRGBO(252, 233, 187, 1);
        _backgroundColor = [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
        ];
        _iconColor = Colors.white;
        _textColor = Colors.white;
        _actionContainerColor = [
          Colors.blue,
          Colors.blue,
          Colors.blue,
          Colors.blue,
        ];
      });
    }
  }

  @override
  void initState() {
    changeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onLongPress: () {
            if (colorSwitched) {
              colorSwitched = false;
            } else {
              colorSwitched = true;
            }
            changeTheme();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  logoImage,
                  fit: BoxFit.contain,
                  height: 100.0,
                  width: 100.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Hello',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      'Adeel Ashraf',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: _borderContainer,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.2, 0.4, 0.6, 0.8],
                              colors: _actionContainerColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 100,
                              child: Center(
                                child: ListView(
                                  children: <Widget>[
                                    Text(
                                      '100',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: _textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 50),
                                    ),
                                    Text(
                                      'Available Cash',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: _iconColor, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Divider(
                          //   height: 0.5,
                          //   color: Colors.white,
                          // ),
                          Table(
                            border: TableBorder.symmetric(
                              inside: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 0.5),
                            ),
                            children: [
                              TableRow(children: [
                                _actionList(
                                    'assets/images/ic_send.png', 'Send Money'),
                                _actionList(
                                    'assets/images/ic_money.png', 'Request'),
                              ]),
                              TableRow(children: [
                                _actionList('assets/images/ic_transact.png',
                                    'Transactions'),
                                _actionList('assets/images/ic_reward.png',
                                    'Reward Points'),
                              ])
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// custom action widget
  Widget _actionList(String iconPath, String desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            iconPath,
            fit: BoxFit.contain,
            height: 45.0,
            width: 45.0,
            color: _iconColor,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor),
          )
        ],
      ),
    );
  }
}
