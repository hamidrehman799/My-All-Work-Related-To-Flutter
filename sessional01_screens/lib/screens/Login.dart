import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8.0,)
        ],
      ),
      child: Padding(padding: EdgeInsets.symmetric(
        horizontal: 10.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
        Text('Login Account',
          style: TextStyle(
          color: Colors.grey[800],
            fontWeight: FontWeight.w800,
            fontSize: 15.0,
        ),
        ),
          SizedBox(height: 10.0),
          TextField(decoration: InputDecoration(hintText: 'User Name or Email'),
          ),
          SizedBox(height: 10.0),
          TextField(decoration: InputDecoration(hintText: 'PassWord'),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('forget password?',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 80.0),

            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text('Log In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
      ],),
      ),
    );
  }
}
