import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/constants/colors.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  PasswordResetFunction() {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim())
        .then((value) {
      Navigator.of(context).pop();
      SnackBar(
        content: Text("Success!"),
      );
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error ${error.toString()}"),
        ),
      );
    });
    ;
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
                child: const Text(
                  "Password Reset",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(112, 41, 99, 10)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 65,
                width: 10,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {
                      PasswordResetFunction();
                    },
                    child: Text("Reset")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Remember Password?'),
                  TextButton(
                    // ignore: sort_child_properties_last
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
            ],
          ),
        )));
    ;
  }
}
