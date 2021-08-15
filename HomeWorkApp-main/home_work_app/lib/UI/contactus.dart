import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:home_work_app/theme//theme.dart';
import 'Navigation_Drawer.dart';
import 'my_flutter_app_icons.dart';
import 'selected_type.dart';
class contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: kPrimaryGradient,
            ),

          ),
          title: Text("Contact Us"),
          actions: [IconButton(icon: Icon(MyFlutterApp.home), onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>selecttype()));

          })],
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith( //This will change the drawer background to blue.

          ),
          child: Drawer(
            child: MainDrawer(),
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: kPrimaryGradient,
          ),
          child: ContactUs(
            logo: AssetImage('images/tc1.jpg'),
            email: 'rehamnaliawans@gmail.com',
            companyName: 'Tech Creations',
            phoneNumber: '+923086464008',
            githubUserName: 'rehmanaliawans',
            linkedinURL: 'https://www.linkedin.com/in/rehman-ali-8a94b6150/',
            tagLine: 'Flutter Developer',
            twitterHandle: 'REHMAN6464',
          ),
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Tech Creations',
          textColor: Colors.white,
          backgroundColor: Colors.teal.shade300,
          email: 'rehmanaliawans@gmail.com',
        ),
      ),
    );
  }
}
