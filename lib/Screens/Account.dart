import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studieey/Features/Drawer.dart';

class Account extends StatefulWidget {
  static const routeName = "/Account";
  final String username;
  Account({required this.username});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(username: widget.username),
      body: Column(children: [
        Flexible(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff009FFF), Color(0xFFec2F4B)])),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                            height: 150,
                            width: 150,
                            child: CircleAvatar(
                                child:
                                    SvgPicture.asset("assets/images/1.svg"))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.username,
                          style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Siddaganga Institute Of Technology",
                          style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 15, color: Colors.white),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Phone Number",
                    style: GoogleFonts.encodeSansSemiExpanded(),
                  ),
                  subtitle: Text("+91-123456789"),
                ),
                ListTile(
                  title: Text(
                    "Email",
                    style: GoogleFonts.encodeSansSemiExpanded(),
                  ),
                  subtitle:
                      Text(FirebaseAuth.instance.currentUser!.email.toString()),
                ),
                ListTile(
                  title: Text(
                    "Your unique Id",
                    style: GoogleFonts.encodeSansSemiExpanded(),
                  ),
                  subtitle:
                      Text(FirebaseAuth.instance.currentUser!.uid.toString()),
                ),
              ],
            ))
      ]),
    );
  }
}
