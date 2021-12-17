import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovers/screens/home_screen.dart';
import 'package:themovers/utils/colors.dart';
import 'package:themovers/utils/screen_utils.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otpScreen';
  final String phone;

  OtpScreen(this.phone);

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  int startT = 60;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: kTextColorForth,
    borderRadius: BorderRadius.circular(getProportionateScreenHeight(5)),
    border: Border.all(
      color: kSecondaryblue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: kFillColorAccent,

      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(24),
            horizontal: getProportionateScreenWidth(32),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: kTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                'Verify Code',
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                'This Code is Send To +92-${widget.phone}',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(100),
                      ),
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(200),
                      child: Image.asset(
                        'assets/images/otp.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(30)),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: kTextColor,
                  ),
                  eachFieldWidth: getProportionateScreenHeight(40),
                  eachFieldHeight: getProportionateScreenHeight(40),
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      _scaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text('invalid OTP')));
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't you receive any code?",
                      style: GoogleFonts.roboto(
                        fontSize: 11,
                        color: kTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                     Text(
                        "Resend Code in 00:${startT} sec",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),

                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {}
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

}
