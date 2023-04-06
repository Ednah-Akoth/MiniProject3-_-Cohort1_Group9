import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../navpages/screens/home_page.dart';
import '../welcome/sign_up1.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
// These should be outside class body definition
  int currentPage = 0;

  int counter = 0;

  // controller for smooth page indicator
  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //get size of device to resize image to half of screen size
    final pages = [
      onboardingItem1(size: size),
      onboardingItem2(size: size),
      onboardingItem3(size: size),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            // slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: OnPageChangeCallback,
          ),

          // button at the bottom for next page
          Positioned(
              bottom: 60,
              child: OutlinedButton(
                onPressed: () {
                  counter++;
                  if (counter == 3) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EmailSignup()));
                  } else {
                    int nextPage = controller.currentPage + 1;
                    controller.animateToPage(page: nextPage);
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(color: tTextColor),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20)),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(color: tTextColor, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: WormEffect(activeDotColor: tTextColor, dotHeight: 5),
              ))
        ],
      ),
    );
  }

  OnPageChangeCallback(int activePageIndex) {
    if (currentPage == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        currentPage = activePageIndex;
      });
    }
  }
}

class onboardingItem1 extends StatelessWidget {
  const onboardingItem1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: tPrimaryOnboarding1,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(onboarding1),
              height: size.height * 0.4,
            ),
            Column(
              children: [
                Text("No more ghosting",
                    style: Theme.of(context).textTheme.headline3),
                Text("Get fast responses from recruiters",
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ]),
    );
  }
}

class onboardingItem2 extends StatelessWidget {
  const onboardingItem2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: tPrimaryOnboarding2,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(onboarding2),
              height: size.height * 0.4,
            ),
            Column(
              children: [
                Text("Up to Date Opportunities",
                    style: Theme.of(context).textTheme.headline3),
                Text("Receive the latest opportunities from recruiters",
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ]),
    );
  }
}

class onboardingItem3 extends StatelessWidget {
  const onboardingItem3({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: tPrimaryOnboarding3,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(onboarding3),
              height: size.height * 0.4,
            ),
            Column(
              children: [
                Text("Find Meaningful work",
                    style: Theme.of(context).textTheme.headline3),
                Text("Connect with companies that value their employees",
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ]),
    );
  }
}
