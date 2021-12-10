import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/providor/login.dart';
import '../login%20&%20signup/otp_screen.dart';
import 'package:thexmovers/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _numberFocusNode = FocusNode();
  var _editedProfile = profiledetails(
    id: null,
    number: 0,
  );
  var _initValues = {
    'number': '',
  };
  var _isInit = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kFillColorAccent,
//backgroundColor: Colors.blue,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: kFillColorAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 10,
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
                    height: 28,
                  ),
                  Container(
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: kFillColorPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 14.0, 5.0, 14.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black45.withOpacity(0.12),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
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
                        ),
                        SizedBox(
                          height: 22,
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
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Send',
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: kFillColorPrimary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
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
