import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:memeapp/selectionpage.dart';

class splsh extends StatelessWidget {
  const splsh({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text(
          'MADE BY \n KARAN SINGH' , style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
          color: Colors.black,
          fontSize: 40,
        ),
        ),
      backgroundColor: Colors.grey,
      centered: true,
      splashIconSize: 300,
      nextScreen: selectionpage(),
      splashTransition: SplashTransition.fadeTransition,

      duration: 2000,
    );;
  }
}
