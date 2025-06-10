import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unipal/screens/register/sign_up_screen.dart';

class SplashSceen extends StatelessWidget {
  const SplashSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset('assets/Animation - 1748901363193.json'),
          ),
        ],
      ),
      nextScreen: SignUpScreen(),
      duration: 2000,
      centered: true,
    );
  }
}
