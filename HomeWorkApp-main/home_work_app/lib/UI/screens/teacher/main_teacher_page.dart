import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_work_app/UI/SingIn.dart';
import 'package:home_work_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:home_work_app/animation/fade_animation.dart';
import 'package:home_work_app/UI/screens/teacher/classes_page_teacher.dart';
import 'package:home_work_app/widgets/card_item.dart';

import '../../Navigation_Drawer.dart';
import '../../contactus.dart';
import '../../my_flutter_app_icons.dart';
import '../../selected_type.dart';

class MainTeacherPage extends StatefulWidget {
  // static const routeName = '/main-teacher-page';

  @override
  _MainTeacherPageState createState() => _MainTeacherPageState();
}

class _MainTeacherPageState extends State<MainTeacherPage> {
  //
  // TeacherInf getTeacherInfo;
  //
  // String teacherId;
  // String teacherName;
  // String teacherAddress;
  // String teacherNumber;
  // String teacherSubject;
  // String schoolId;





  @override
  Widget build(BuildContext context) {


    // get teacher data
    // getTeacherInfo= Provider.of<Teacher>(context).getTeacherInf();
    //
    // teacherId = getTeacherInfo.id;
    // teacherName = getTeacherInfo.name;
    // teacherAddress = getTeacherInfo.address;
    // teacherNumber = getTeacherInfo.number;
    // teacherSubject=getTeacherInfo.subject;
    // schoolId=getTeacherInfo.schoolID;


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //################  APP BAR   ########################//
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: kPrimaryGradient,
            ),
          ),
          title: Center(
            child: Text(
              "Teacher Panel",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(MyFlutterApp.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainTeacherPage()));
                }),
            IconButton(
              icon: const Icon(Icons.contact_phone_outlined),
              tooltip: 'ContactUs',
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => contactus()));
              },
            ),
          ],
        ),

        //################  DRAWER  ########################//
        drawer: Theme(
          data: Theme.of(context).copyWith(
            //This will change the drawer background to blue.

          ),
          child: Drawer(
            child: MainDrawer(),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color.fromRGBO(154, 233, 178, 1),
                Color.fromRGBO(173, 187, 238, 1),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Teacher, Rehman ALi",
                              style: GoogleFonts.antic(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 25,
                              ),
                            ))),

                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Subject : English",
                              style: GoogleFonts.antic(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 25,
                              ),
                            ))),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Address : Canal view",
                              style: GoogleFonts.asar(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 20,
                              ),
                            ))),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Phone Number : 030",
                              style: GoogleFonts.asar(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 20,
                              ),
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  padding: EdgeInsets.all(20),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[

                      CardItem(
                          desc: 'Classes/ Add Task',
                          img: 'assets/images/class-icon.png',
                          color: Color.fromRGBO(120, 99, 101, 1),
                          function: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(

                                // builder: (context) => TeacherClasses(teacherId: teacherId,schoolId:schoolId)),
                                  builder: (context) => TeacherClasses()),
                            );
                          }
                      ),

                      CardItem(
                          desc: 'Check Task',
                          img: 'assets/images/tasks-icon.png',
                          color: Color.fromRGBO(120, 110,230, 1),
                          function: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => TeacherClasses(teacherId: teacherId,schoolId:schoolId)),
                                  builder: (context) => TeacherClasses()),
                            );
                          }
                      ),
                      CardItem(
                          desc: 'Upload Marks',
                          img: 'assets/images/upload.png',
                          color: Color.fromRGBO(120, 99, 111, 1),
                          function: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => TeacherClasses(teacherId: teacherId,schoolId:schoolId)),
                                  builder: (context) => TeacherClasses()),
                            );
                          }
                      ),


                      CardItem(
                          desc: 'log Out',
                          img: 'assets/images/logout-icon.png',
                          color: Color.fromRGBO(154, 80, 80, 1),
                          function: (){

                            //   Provider.of<Teacher>(context).logOut();
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signin()),
                            );
                          }
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
