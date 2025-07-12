import 'package:database_series/loginpage.dart';
import 'package:database_series/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController emailController = TextEditingController();
  forgetpassword(String email) async {
    if (email == " ") {
      return UiHelper.CustomAlertBox(
        context,
        "Enter an Email to Rest Password",
      );
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          SizedBox(height: 20),
          UiHelper.CustomButton(() {
            forgetpassword(emailController.text.toString());
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => Loginpage()));
          }, "Reset Password"),
        ],
      ),
    );
  }
}
