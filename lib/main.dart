import 'package:flutter/material.dart';
import 'package:unipal/constans/strings.dart';
import 'package:unipal/screens/home%20screen/home_screen.dart';
import 'package:unipal/screens/splash%20scren/splash_sceen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const SplashSceen(),
      routes: {
        splashSceen: (context) => SplashSceen(),
        homeScreen: (context) => HomeScreen(),
        loginscreen: (context) => HomeScreen(),
        signupscreen: (context) => HomeScreen(),
      },
    );
  }
}
