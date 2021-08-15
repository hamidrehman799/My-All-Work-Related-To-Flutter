import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_work_app/animation/fade_animation.dart';
import 'package:home_work_app/UI/screens/student/task_page.dart';
import 'package:home_work_app/theme/theme.dart';
import 'package:home_work_app/widgets/teachers/group_tile_teacher.dart';

import '../../Navigation_Drawer.dart';
import '../../contactus.dart';
import '../../my_flutter_app_icons.dart';
import '../../selected_type.dart';
import 'main_student_page.dart';

class TeacherClasses extends StatefulWidget {
  final String teacherId;
  final String schoolId;

  TeacherClasses({this.teacherId, this.schoolId});

  @override
  _TeacherClassesState createState() => _TeacherClassesState();
}

class _TeacherClassesState extends State<TeacherClasses> {
  var groups;

  @override
  void initState() {
    // groups = GetHelper.getData(widget.teacherId, 'get_teacher_groups',
    //  'teacher_id'); // get the data using this function from GetHelper class we pass
    //the teacher id and name of php file that we use to get data then kind of input for data
    // if you do not understand go and have look at GetHelper class
    super.initState();
  }

  // go to task page
  goTaskForm(QuerySnapshot groupId, String schoolId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => studenttask(

          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //################  APP BAR   ########################//
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kPrimaryGradient,
          ),
        ),
        title: Center(
          child: Text(
            "Assign Task ",
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
                    MaterialPageRoute(builder: (context) => MainStudentPage()));
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
                    height: 20,
                  ),
                  Center(
                      child: FadeAnimation(
                          1.3,
                          Text(
                            "Add Task",
                            style: GoogleFonts.antic(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              fontSize: 40,
                            ),
                          ))),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100))),
                  padding: EdgeInsets.all(20),
                  // we will use future builder to show the data in a list view
                  // we put the future variable
                  // check if there is no show a message to user no data
                  // else show a list view with tiles tha show our data
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Add Student').snapshots(),

                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                       if (!snapshot.hasData) {
                         return Center(
                             child: Text('No Classes Right now',
                                 style: GoogleFonts.antic(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 30)));
                       }
                      return ListView(
                        // itemCount: snapshots.data.length,
                        children: snapshot.data.docs.map((document){
                          return  Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                   child: Text(document['Title'],
                                        style: GoogleFonts.antic(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25))
                                ),

                                Expanded(
                                    child: Text(document['Subject'],
                                        style: GoogleFonts.antic(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15))
                                )

                              ],

                            )
                          );

                        }).toList(),
                      );
                    },
                  )),


            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => studenttask()),
                );
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                      Color.fromRGBO(154, 233, 178, 1),
                      Color.fromRGBO(173, 187, 238, 1),
                    ]),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'ADD TASK',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
