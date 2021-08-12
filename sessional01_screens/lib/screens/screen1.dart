import 'package:flutter/material.dart';
import 'package:sessional01_screens/screens/Login.dart';
import 'package:sessional01_screens/screens/color.dart';
import 'package:sessional01_screens/screens/companylogo.dart';
import 'package:sessional01_screens/screens/mycustomclip.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Stack(children: <Widget>[
          ClipPath(

            clipper: MyCustomClipper(),
                 child: Container(

              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryColor,
                    Theme.of(context).primaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

            ),
          ),

          SafeArea(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CompanyLogo(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(50,0,0,0),
                        child: Icon(
                          Icons.chat_sharp,
                          color: Colors.yellow,
                          size: 100.0,

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Login(),
                SizedBox(height: 30.0),

                    Center(


                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Not Registered? ',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18.0,
                            ),
                          ),
                          Text('Create Account',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),

                        ],
                      ),
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

mixin widget {

}
