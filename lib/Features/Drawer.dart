import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studieey/Screens/Account.dart';
import 'package:studieey/Screens/LoginSignUpUI.dart';

import 'Lectures.dart';

class MyAppDrawer extends StatefulWidget {
  final String username;
  MyAppDrawer({required this.username});
  @override
  _MyAppDrawerState createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Welcome',
                style: GoogleFonts.encodeSansSemiExpanded(),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffEB5757), Color(0xff000000)],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 10,
                child: Column(children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: SvgPicture.asset(
                      "assets/images/1.svg",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      widget.username,
                      style: GoogleFonts.sairaSemiCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  )
                ]),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Lectures(
                          userName: widget.username,
                          isTeacher: true,
                        )));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.book_outlined,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Lectures",
                    style: GoogleFonts.encodeSansSemiCondensed(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Account(username: widget.username)),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.account_box_outlined,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Account",
                    style: GoogleFonts.encodeSansSemiCondensed(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => LoginSignUpUI()));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Log Out",
                    style: GoogleFonts.encodeSansSemiCondensed(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
