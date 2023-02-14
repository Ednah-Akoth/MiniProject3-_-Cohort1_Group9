import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/login.dart';


// import 'login.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
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
                    'First Name',
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Enter your First Name',
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Last Name',
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Enter your Last Name',
                  ),
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
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Create Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabled: false,
                    // icon: Icon(Icons.arrow_drop_down),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Select a Country',
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
                    onPressed: null,
                    child: Text("Continue with Email")),
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
