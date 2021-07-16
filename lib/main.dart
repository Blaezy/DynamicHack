import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studieey/Features/Lectures.dart';
import 'package:studieey/Models/Authentication.dart';
import 'package:studieey/Screens/AdminDropDown.dart';
import 'package:studieey/Screens/DashBoard.dart';
import 'package:studieey/Screens/HomeScreen.dart';
import 'package:studieey/Screens/LoginSignUpUI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AutheticationService>(
          create: (_) => AutheticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AutheticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // Lectures(
            //   isTeacher: true,
            // ),
            StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.hasData) {
                    return DashBoard(
                      FirebaseAuth.instance.currentUser!.displayName.toString(),
                    );
                  } else
                    return HomeScreen();
                }),
        routes: {
          AdminDropDown.routeName: (ctx) => AdminDropDown(),
          LoginSignUpUI.routeName: (ctx) => LoginSignUpUI(),
          DashBoard.routeName: (ctx) {
            return DashBoard(
                FirebaseAuth.instance.currentUser!.displayName.toString());
          },
        },
      ),
    );
  }
}
