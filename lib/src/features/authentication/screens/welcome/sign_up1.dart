import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/controllers/auth_service.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/sign_up2.dart';

import 'login.dart';

class EmailSignup extends StatefulWidget {
  @override
  State<EmailSignup> createState() => _EmailSignup();
}

class _EmailSignup extends State<EmailSignup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool googleLoading = false;
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
                    "Create Account",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(112, 41, 99, 10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 20,
                ),
                googleLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            googleLoading = true;
                          });
                          await AuthService().signInWithGoogle(context);
                          setState(() {
                            googleLoading = false;
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black54,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/google.png",
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                      ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: const Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(112, 41, 99, 10)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(112, 41, 99, 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => Signup()),
                              ));
                        }),
                        child: Text("Continue with Email")),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Already have an account?'),
                    TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(112, 41, 99, 10)),
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
                            fontSize: 12,
                            color: Color.fromRGBO(112, 41, 99, 10)),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
