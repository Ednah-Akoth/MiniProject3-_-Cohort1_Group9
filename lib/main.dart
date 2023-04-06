import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_application/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'src/utils/theme.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //make sure firebase is initialized before we run our application
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ;

// if we have already launched the application, it will return 1, else 0
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'JobFinder',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
