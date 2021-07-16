import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studieey/Features/Drawer.dart';
import 'package:studieey/Features/Lectures.dart';
import 'package:studieey/Screens/LoginSignUpUI.dart';

class DashBoard extends StatefulWidget {
  static const routeName = "/Dashboard";
  final String userName;

  DashBoard(this.userName);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String? userName;
  @override
  void initState() {
    userName = widget.userName;
    print(userName);
    super.initState();
    // you can use this.widget.foo here
  }

  String? userNameFromState;
  _DashBoardState({this.userNameFromState});

  @override
  Widget build(BuildContext context) {
    final tacher =
        ModalRoute.of(context)!.settings.arguments.toString().toLowerCase();
    final teacherFlag = tacher == "true" ? true : false;
    return Lectures(isTeacher: teacherFlag, userName: widget.userName);
  }
}
