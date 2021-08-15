import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_work_app/Fade_Animation/FadeAnimation.dart';
import 'Navigation_Drawer.dart';
import 'SingIn.dart';
import 'SingIn.dart';
import 'my_flutter_app_icons.dart';
import 'selected_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(

                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(143, 148, 251, 1),
                      Color.fromRGBO(143, 148, 251, .9),
                    ]
                )
            ),

          ),
          title: Text("SignUp Page",),
          leading:IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>selecttype()));

          }) ,
          actions: [IconButton(icon: Icon(MyFlutterApp.home), onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>selecttype()));

          })],
        ),
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[

                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .9),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _email = value.trim();
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _password = value.trim();
                                  });
                                } ,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                      FadeAnimation(2,  MaterialButton(
                        height: 50.0,
                        minWidth: 600.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        color:  Color.fromRGBO(143, 148, 251, 1),
                        onPressed: () async {
                          dynamic result = await (auth.createUserWithEmailAndPassword(
                              email: _email, password: _password));
                          if (result == null) {
                            final snackBar =
                            SnackBar(content: Text('Please Enter a valid Email'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            final snackBar =
                            SnackBar(content: Text('You are Successfully Registered'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => selecttype()));
                          //HardType
                        },

                        child: new Text(
                          "Register",
                          style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.white),
                        ),),),
                      SizedBox(height: 30,),
                      FadeAnimation(1.5, Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child:RichText(
                          text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                  'Already have an Account?Click  '),
                              TextSpan(
                                  text: 'SignIn',
                                  style: linkStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => signin()));
                                    }),

                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}