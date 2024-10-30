import 'package:flutter/material.dart';
import 'package:health_apps/screen/signin_screen.dart';
import 'package:health_apps/utils/color_utils.dart';
import 'package:health_apps/reusable_widget/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("33ccff"),
              hexStringToColor("ff99cc"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              reusableTextField(
                  "Enter Username", Icons.person_outline, false, _userNameTextController),
              const SizedBox(height: 20),
              reusableTextField(
                  "Enter Email", Icons.email_outlined, false, _emailTextController),
              const SizedBox(height: 20),
              reusableTextField(
                  "Enter Password", Icons.lock_outline, true, _passwordTextController),
              const SizedBox(height: 20),
              signInSignUpButton(context, false, () {
                // Replace this with your sign-up logic
                print("Sign-Up button pressed");

                // Navigate back to Sign-In screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              }),
            ],
          ),
        )),
      ),
    );
  }
}

