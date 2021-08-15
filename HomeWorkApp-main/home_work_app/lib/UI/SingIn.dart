import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_work_app/Fade_Animation/FadeAnimation.dart';
import 'package:home_work_app/UI/screens/student/main_student_page.dart';
import 'SignUp.dart';
import 'my_flutter_app_icons.dart';
import 'selected_type.dart';
import 'package:firebase_auth/firebase_auth.dart';



TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
TextStyle linkStyle = TextStyle(color:  Color.fromRGBO(143, 148, 251, 1),);

class signin extends StatefulWidget {

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {

  String _email, _password;

  final auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),

      home: Scaffold(
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
            title: Text("SignIn Page"),
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
                              child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
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
                                    color: Color.fromRGBO(143, 148, 251, .5),
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
                                  keyboardType: TextInputType.emailAddress,
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
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  obscureText: true,
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 30,),
                        FadeAnimation(2, new MaterialButton(
                          height: 50.0,
                          minWidth: 600.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          color:  Color.fromRGBO(143, 148, 251, 1),
                          onPressed: () async {

                            dynamic result = await auth.signInWithEmailAndPassword(
                                email: _email, password: _password);
                            if (result != null) {
                              setState(() {
                                final snackBar =
                                SnackBar(content: Text('Sign in Sucessfully'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => MainStudentPage()));
                              });
                            } else {
                              final snackBar = SnackBar(
                                  content:
                                  Text('Could not Sign in With those credentials'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: new Text(
                            "Login",
                            style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                        ),
                        SizedBox(height: 30,),
                        FadeAnimation(1.5, Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child:RichText(
                            text: TextSpan(
                                  style: defaultStyle,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Create a new Account?Click  '),
                                    TextSpan(
                                        text: 'SignUp',
                                        style: linkStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                                          }
                                          ),

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
      ),
    );
  }
}