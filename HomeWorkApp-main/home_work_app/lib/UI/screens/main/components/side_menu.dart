import 'package:home_work_app/UI/screens/dashboard/Removeteacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_work_app/UI/screens/dashboard/components/Rteacher.dart';
import 'package:home_work_app/UI/screens/dashboard/dashboard_screen.dart';

import '../../../selected_type.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.jpg"),
            ),
            DrawerListTile(
              title: "Add Teacher And Students",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {


              },
            ),
            DrawerListTile(
              title: "View Teachers",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Update Teacher",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Delete Teachers",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rteacher()),
                );
              },
            ),
            DrawerListTile(
              title: "Add/Delete/Update Subjects",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Add Classes",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Admit or Kick Student",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Log Out",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => selecttype()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
