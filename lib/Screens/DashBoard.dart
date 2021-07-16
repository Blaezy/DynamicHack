import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: tacher == 'true' ? Text("Teacher") : Text("Student"),
            ),
            Center(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      //FirebaseFirestore.instance.collection('users').doc()
                      print(ModalRoute.of(context)!.settings.arguments);
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginSignUpUI()));
                    },
                    child:
                        tacher == 'true' ? Text("SignOut") : Text("log out")),
              ),
            )
          ],
        ),
      ),
    );
  }

  Drawer AppDrawer(BuildContext context) {
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
                      userName!,
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
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Lectures(
                          isTeacher: true,
                        )));
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
        ],
      ),
    );
  }
}
