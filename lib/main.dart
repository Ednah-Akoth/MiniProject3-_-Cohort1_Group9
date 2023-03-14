import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_finder/src/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //make sure firebase is initialized before we run our application
  await Firebase.initializeApp();

// if we have already launched the application, it will return 1, else 0
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'JobFinder',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      // initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      // routes: {
      //   'onboard': (context) => SplashScreen(),
      //   'home':(context) => SplashScreen()
      // },
    );
  }
}
