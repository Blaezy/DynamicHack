import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studieey/Screens/LoginSignUpUI.dart';

class AuthFunctionality extends StatefulWidget {
  const AuthFunctionality({Key? key}) : super(key: key);

  @override
  _AuthFunctionalityState createState() => _AuthFunctionalityState();
}

class _AuthFunctionalityState extends State<AuthFunctionality> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String name, String email, String password, bool isLogin,
      BuildContext ctx) async {
    print(name);
    print(email);
    print(password);
    print(_auth);
    print(isLogin);
    print(_isLoading);
    UserCredential authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'username': name,
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      var message = "An Error Ocurred ,Please check your Credentials";
      if (err.message!.isNotEmpty) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text(err.toString())));
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginSignUpUI(),
    );
  }
}
