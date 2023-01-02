import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:play_with_api/screens/login/view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/images/splash.png',
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: const Color(0xff5A55CA),
        animationDuration: const Duration(seconds: 5),
        centered: true,
        duration: 10,
      ),
    );
  }
}
