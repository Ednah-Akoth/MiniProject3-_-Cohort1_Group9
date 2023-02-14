import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/screens/navpages/main_page.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/sign_up1.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 249, 1),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Hi, Welcome Back! 👋",
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
                    'Welcome',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 65,
                width: 10,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(247, 245, 246, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: null,
                    icon: Icon(
                      Icons.g_mobiledata,
                      size: 40,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Continue with Google",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
                width: 20,
              ),
              SizedBox(
                height: 65,
                width: 10,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(247, 245, 246, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: null,
                    // (() {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: ((context) => MyHomePage()),
                    //       ));
                    // }),
                    icon: Icon(
                      Icons.apple,
                      size: 40,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Continue with Apple",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(112, 41, 99, 10)),
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Enter your Email',
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(112, 41, 99, 10)),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabled: false,
                    // icon: Icon(Icons.arrow_drop_down),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Enter Password',
                  ),
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
                      backgroundColor: Color.fromRGBO(112, 41, 99, 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => MainPage()),
                          ));
                    }),
                    child: Text("Login")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Don’t have an account?'),
                  TextButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => EmailSignup()),
                          ));
                    }),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 12, color: Color.fromRGBO(112, 41, 99, 10)),
                    ),
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
                      //signup screen
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
