import 'dart:async';
import 'package:flutter/material.dart';


import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/auth_controller.dart';
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
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AuthController())));
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
              left: 60,
            )
          ],
        ));
  }
}
