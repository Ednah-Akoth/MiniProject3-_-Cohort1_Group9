import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../navpages/screens/main_page.dart';
import '../screens/onboarding_screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/welcome/login.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainPage();
            } else {
              return initScreen == 0 || initScreen == null
                  ? OnboardingScreen()
                  : Login();
            }
          }),
    );
  }
}
