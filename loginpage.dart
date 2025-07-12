import 'package:database_series/forgetpassword.dart';
import 'package:database_series/home_page.dart';
import 'package:database_series/signuppage.dart';
import 'package:database_series/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!context.mounted) return; // Prevent error

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => HomePage()),
      );
    } on FirebaseAuthException catch (ex) {
      if (context.mounted) {
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          UiHelper.CustomTextField(
            passwordController,
            "Password",
            Icons.password,
            true,
          ),
          SizedBox(height: 30),
          UiHelper.CustomButton(() {
            login(
              emailController.text.toString(),
              passwordController.text.toString(),
            );
          }, "Login"),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already  Have an Account??",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signuppage()),
                  );
                },
                child: Text("Sign Up", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Forgetpassword()),
              );
            },
            child: Text("Forget Password??", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
