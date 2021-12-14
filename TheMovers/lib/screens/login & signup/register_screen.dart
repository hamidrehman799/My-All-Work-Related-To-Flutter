import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovers/utils/screen_utils.dart';
import '../login%20&%20signup/otp_screen.dart';
import 'package:themovers/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _numberFocusNode = FocusNode();

  var _initValues = {
    'number': '',
  };

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kFillColorAccent,
//backgroundColor: Colors.blue,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25) ,
                  horizontal: getProportionateScreenWidth(25)),
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
                    height: getProportionateScreenHeight(15),
                  ),
                  Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(150),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    'LOGIN',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    "Add your phone number. we'll send you a verification code so we know you're real",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(28),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      getProportionateScreenWidth(35),
                    ),
                    decoration: BoxDecoration(
                      color: kTextColorForth,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                         Material(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black45.withOpacity(0.12),
                            child: Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(12)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                initialValue: _initValues['numer'],
                                decoration: InputDecoration(
                                  labelText: 'Enter Phone Number',
                                  icon: Icon(Icons.phone),
                                  border: InputBorder.none,
                                ),
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_numberFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please provide a value.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        SizedBox(
                          height: getProportionateScreenHeight(22),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(otpscreen.routeName);
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                kFillColorAccent,
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                kSecondaryblue,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                              child: Text(
                                'Send',
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: kFillColorPrimary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
