import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "TEH MOVERS",
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Stack(
        children: <Widget>[
          Container(
            child: Container(
                margin: EdgeInsets.fromLTRB(30, 20, 30, 50),
                child: Image.asset("assets/images/logo.png")),
            height: 200,
            width: 450,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(),
            ),
          ),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 150, 30, 2),
                child: SizedBox(
                  child: Container(
                    alignment: Alignment.center,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.blue.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: Form(
                          child: ListView(
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.topCenter,
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 5.0),
                                  child: Text(
                                    "CONTACT US",
                                    style: GoogleFonts.roboto(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30.0, 10.0, 30.0, 5.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black45.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      // controller: _nameTextController,
                                      decoration: InputDecoration(
                                        hintText: "Name",
                                        icon: Icon(Icons.person_outline),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30.0, 10.0, 30.0, 5.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black45.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      //  controller: _secondnameTextController,
                                      decoration: InputDecoration(
                                        hintText: "Phone Number",
                                        icon: Icon(Icons.phone),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30.0, 10.0, 30.0, 5.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black45.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      //   controller: _emailController,
                                      decoration: InputDecoration(
                                        hintText: "Subject",
                                        icon: Icon(Icons.subject),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30.0, 10.0, 30.0, 5.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black45.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      minLines: 1,
                                      maxLines: 6,
                                      // controller: _cnicController,
                                      decoration: InputDecoration(
                                        hintText: "Your Message",
                                        icon: Icon(Icons.message),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30.0, 30.0, 30.0, 5.0),
                                child: Material(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.blue.withOpacity(0.9),
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           Homepage()),
                                        // );
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Send",
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
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 20, 2),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AutoSizeText(
                              "Email",
                              style: GoogleFonts.roboto(
                                  color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: <Widget>[
                            AutoSizeText(
                              "adeel@gmail.com",
                              style: GoogleFonts.roboto(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(90, 10, 20, 2),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AutoSizeText(
                              "Phone",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: <Widget>[
                            AutoSizeText(
                              "03001234567",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
