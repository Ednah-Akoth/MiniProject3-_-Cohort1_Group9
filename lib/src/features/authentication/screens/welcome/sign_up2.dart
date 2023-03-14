import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/login.dart';
import 'package:job_finder/src/features/navpages/screens/home_page.dart';
import 'package:job_finder/src/features/navpages/screens/main_page.dart';
import '../../../../constants/colors.dart';

// import 'login.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  void SignUpFunction() {
    if (passwordConfirmed()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) {
        print("Created new account");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Success!"),
          ),
        );
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error ${error.toString()}"),
          ),
        );
      });
    } else {
      print("passwords don't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("passwords don't match"),
        ),
      );
    }
  }

// password confirmation check
  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 249, 1),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(112, 41, 99, 10)),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Email',
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Enter your Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: tPrimaryColor,
                      )),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Password',
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Enter your Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: tPrimaryColor,
                      )),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: confirmpasswordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: tPrimaryColor,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              SizedBox(
                height: 65,
                width: 10,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {
                      SignUpFunction();
                      // FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //         email: emailController.text.trim(),
                      //         password: passwordController.text.trim())
                      //     .then((value) {
                      //   print("Created new account");
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => Welcome()));
                      // }).onError((error, stackTrace) {
                      //   print("Error ${error.toString()}");
                      // });
                    },
                    child: Text("Sign Up")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 12, color: Color.fromRGBO(112, 41, 99, 10)),
                    ),
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Login()),
                          ));
                    }),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('By signing up you agree to our'),
                  TextButton(
                    child: const Text(
                      'Terms and Conditions of Use',
                      style: TextStyle(
                          fontSize: 12, color: Color.fromRGBO(112, 41, 99, 10)),
                    ),
                    onPressed: () {
                      //Terms and conditions
                    },
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
