import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoverx/home/draw.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //TextEditingController _emailTextController = TextEditingController();
  // TextEditingController _nameTextController = TextEditingController();
  // TextEditingController _secondnameTextController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _cnicController = TextEditingController();
  // String gender;
  String groupValue = "male";
  bool hidepass = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                size: 32,
                color: Colors.black54,
              ),
            ),
          ),

          // Image.asset(
          //   'assets/images/back.jpg',
          //   fit: BoxFit.fill,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Container(
            color: Color(0xfff7f6fb),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(80),
            child: Image.asset(
              'assets/images/logo.png',
              width: 150.0,
              height: 150.0,
            ),
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(100.0, 230.0, 100.0, 14.0),
              child: Text(
                "Sign Up",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 14.0, 30.0, 14.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black45.withOpacity(0.12),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              //controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "First Name",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 14.0, 30.0, 14.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black45.withOpacity(0.12),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              // controller: _secondnameTextController,
                              decoration: InputDecoration(
                                hintText: "Second Name",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 14.0, 30.0, 14.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black45.withOpacity(0.12),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              //  controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.email),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 14.0, 30.0, 14.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black45.withOpacity(0.12),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              // controller: _cnicController,
                              decoration: InputDecoration(
                                hintText: "CNIC",
                                icon: Icon(Icons.card_membership),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 14.0, 30.0, 14.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.blue.withOpacity(0.9),
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
