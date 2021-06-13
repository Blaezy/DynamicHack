import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studieey/Features/AuthFunctionality.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studieey/Features/Lectures.dart';
import 'package:studieey/Models/Authentication.dart';
import 'package:studieey/Screens/LoginSignUpUI.dart';

import 'Screens/DashBoard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData) {
                // print(userSnapshot.data);

                return DashBoard(
                  FirebaseAuth.instance.currentUser!.displayName.toString(),
                );
              } else
                return LoginSignUpUI();
            }),
      ),
    );
  }
}
