import 'package:flutter/material.dart';
import 'package:job_finder/src/constants/colors.dart';
import 'package:job_finder/src/features/authentication/screens/jobs/specific_job.dart';
import 'package:job_finder/src/features/authentication/screens/navpages/chat_page.dart';
import 'package:job_finder/src/features/authentication/screens/navpages/home_page.dart';
import 'package:job_finder/src/features/authentication/screens/navpages/myjobs_page.dart';
import 'package:job_finder/src/features/authentication/screens/navpages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List pages = [HomePage(), ChatPage(), MyJobsPage(), ProfilePage()];
  List pages = [HomePage(), ChatPage(), SpecificJob(), ProfilePage()];
  int currentIndex = 0;
  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: tPrimaryColor,
        unselectedItemColor: tTextAccentColor.withOpacity(0.6),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        elevation: 70.0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat)),
          BottomNavigationBarItem(label: "MyJobs", icon: Icon(Icons.work)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
