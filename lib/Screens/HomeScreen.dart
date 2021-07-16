import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studieey/Screens/AdminDropDown.dart';
import 'package:studieey/Screens/LoginSignUpUI.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/19742.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose your Appropriate Category",
              style: GoogleFonts.encodeSansExpanded(
                  color: Colors.green.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: deviceHeight * 0.025),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AdminDropDown.routeName, arguments: true);
              },
              child: homeScreenItem(
                  "assets/images/2.svg", deviceHeight, deviceWidth, "Admin"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(LoginSignUpUI.routeName, arguments: true);
              },
              child: homeScreenItem(
                  "assets/images/4.svg", deviceHeight, deviceWidth, "Teacher"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(LoginSignUpUI.routeName, arguments: false);
              },
              child: homeScreenItem(
                  "assets/images/3.svg", deviceHeight, deviceWidth, "Student"),
            ),
          ],
        ),
      ),
    );
  }

  Center homeScreenItem(
      String AssetPath, double height, double width, String designation) {
    return Center(
      child: Container(
        height: height * 0.25,
        width: width * 0.45,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10), color: Colors.black12, blurRadius: 10),
            BoxShadow(
                offset: Offset(-10, -10),
                color: Colors.white.withOpacity(0.45),
                blurRadius: 10),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(children: [
              Expanded(
                flex: 5,
                child: SvgPicture.asset(
                  AssetPath,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    designation,
                    style: GoogleFonts.encodeSansSemiCondensed(
                        color: Colors.green),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
