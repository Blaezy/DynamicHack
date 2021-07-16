import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studieey/Models/Authentication.dart';
import 'package:studieey/Models/UserDetails.dart';
import 'package:provider/provider.dart';
import 'package:studieey/Screens/HomeScreen.dart';

class LoginSignUpUI extends StatefulWidget {
  static const routeName = "/LoginSignup";

  @override
  _LoginSignUpUIState createState() => _LoginSignUpUIState();
}

class _LoginSignUpUIState extends State<LoginSignUpUI> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  //FocusNode _emailFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();
  bool isLogin = false;
  var _user = UserDetails("", "", "");

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // void _saveForm() {
  //   //Focus.of(context).unfocus();
  //   final isValid = _key.currentState!.validate();
  //   if (!isValid) {
  //     print("invalid");
  //     return;
  //   }

  //   _key.currentState!.save();
  //   widget.submitFn(_user.name, _user.email, _user.password, isLogin, context);
  //   print(_user.name);
  //   print(_user.email);
  //   print(_user.password);
  // }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Object? teacher =
        ModalRoute.of(context)!.settings.arguments.toString().toLowerCase();
    final teacherFlag = teacher == "true" ? true : false;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.hardLight),
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Form(
          key: _key,
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "STUDIeey",
                    style: GoogleFonts.encodeSansSemiCondensed(
                        color: Colors.white,
                        //fontWeight: FontWeight.w500,
                        fontSize: 40),
                  ),
                ),
              ),
              if (isLogin == false)
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(),
                  child: TextFormField(
                    controller: nameController,
                    autofocus: false,
                    key: ValueKey("Name"),
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0)),
                      labelText: "Name",
                      labelStyle:
                          GoogleFonts.encodeSansCondensed(color: Colors.white),
                      border: OutlineInputBorder(),
                      hintText: "Enter Name",
                      hintStyle:
                          GoogleFonts.encodeSansExpanded(color: Colors.white),
                      //errorText: "Please enter Email to continue",
                      prefixIcon: Icon(
                        Icons.account_box_outlined,
                        color: Colors.green,
                      ),
                    ),
                    onSaved: (value) {
                      _user.name = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) return "Please Provide a valid name";
                      return null;
                    },
                  ),
                ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: TextFormField(
                  controller: emailController,
                  autofocus: false,
                  key: ValueKey("Email"),
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 2.0)),
                    labelText: "Email",
                    labelStyle:
                        GoogleFonts.encodeSansCondensed(color: Colors.white),
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                    hintStyle:
                        GoogleFonts.encodeSansExpanded(color: Colors.white),
                    //errorText: "Please enter Email to continue",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.green,
                    ),
                  ),
                  onSaved: (value) {
                    _user.email = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "Please Provide a valid Email";
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: TextFormField(
                  controller: passwordController,
                  key: ValueKey('password'),
                  //focusNode: _emailFocusNode,
                  obscureText: _obscureText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    errorStyle: GoogleFonts.encodeSansSemiExpanded(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 2.0)),
                    labelText: "Password",
                    labelStyle:
                        GoogleFonts.encodeSansCondensed(color: Colors.white),
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    hintStyle: GoogleFonts.encodeSansExpanded(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                    //errorText: "Please enter Email to continue",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.green,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _toggle();
                      },
                      child: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  onSaved: (value) {
                    _user.password = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Please Provide a valid password";
                    return null;
                  },
                ),
              ),
              // if (widget.isLoading)
              //   Center(
              //     child: CircularProgressIndicator(),
              //   ),
              //if (!widget.isLoading)
              Center(
                child: Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () async {
                          isLogin
                              ? context.read<AutheticationService>().signIn(
                                    context: context,
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    isTeacher: teacherFlag,
                                  )
                              : context.read<AutheticationService>().signUp(
                                    context: context,
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    isTeacher: teacherFlag,
                                  );
                          print(nameController.text.trim());
                        },
                        child: Text(isLogin == false ? "SignUp" : "LogIn",
                            style: GoogleFonts.encodeSansSemiExpanded()))),
              ),
              // if (!widget.isLoading)
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      isLogin == false
                          ? "Already have an account"
                          : "Doesn't have an Account",
                      style: GoogleFonts.encodeSansSemiExpanded(
                          color: Colors.white)),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin == false ? "Login" : "Signup",
                      style: GoogleFonts.encodeSansSemiExpanded(
                          color: Colors.green),
                    ),
                  ),
                  Text("Instead",
                      style: GoogleFonts.encodeSansSemiExpanded(
                          color: Colors.white))
                ],
              )),

              Center(
                child: Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () async {
                          // print(ModalRoute.of(context)!
                          //     .settings
                          //     .arguments
                          //     .runtimeType);

                          print(teacher);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text("Go back",
                            style: GoogleFonts.encodeSansSemiExpanded()))),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
