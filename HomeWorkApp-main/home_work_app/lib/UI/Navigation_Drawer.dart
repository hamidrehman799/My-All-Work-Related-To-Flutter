import 'package:flutter/material.dart';
import 'package:home_work_app/UI/Adminpage.dart';
import 'package:home_work_app/UI/screens/student/main_student_page.dart';
import 'package:home_work_app/UI/screens/teacher/main_teacher_page.dart';
import 'package:home_work_app/UI/selected_type.dart';
import 'contactus.dart';
import 'AppColors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage("assets/workk.gif"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Home Work Management \n App",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.deepOrange[800],
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans'),
              ),
              SizedBox(
                height: 10.0,
                child: Divider(
                  height: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => selecttype()));
        },
        leading: Icon(
          Icons.assessment,
          color: Colors.black,
        ),
        title: Text(
          "Home Page",
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w800,
              color: Colors.deepOrange[800],
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans'),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => adminpanel()));
        },
        leading: Icon(
          Icons.ac_unit,
          color: Colors.black,
        ),
        title: Text(
          "Admin Panel",
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w800,
              color: Colors.deepOrange[800],
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans'),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainTeacherPage()));
        },
        leading: Icon(
          Icons.ac_unit_rounded,
          color: Colors.black,
        ),
        title: Text(
          "Teacher Panel",
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w800,
              color: Colors.deepOrange[800],
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans'),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainStudentPage()));
          },
        leading: Icon(
          Icons.ac_unit_rounded,
          color: Colors.black,
        ),
        title: Text(
          "Student Panel",
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w800,
              color: Colors.deepOrange[800],
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans'),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => contactus()));
        },
        leading: Icon(
          Icons.account_circle,
          color: Colors.black,
        ),
        title: Text(
          "Contact Us",
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w800,
              color: Colors.deepOrange[800],
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans'),
        ),
      ),
    ]);
  }
}
