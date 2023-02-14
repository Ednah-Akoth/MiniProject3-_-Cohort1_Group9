import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../onboarding_screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tBlackColor,
        body: Stack(
          children: [
            Positioned(
              top: 200,
              left: 30,
              child: Image(image: AssetImage(tLogoImage1)),
            ),
            Positioned(
              child: Text(
                "Land Your Dream Job",
                style: Theme.of(context).textTheme.headline3,
              ),
              top: 450,
              left: 90,
            )
          ],
        ));
  }
}
