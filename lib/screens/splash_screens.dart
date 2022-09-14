import 'package:flutter/material.dart';
import 'package:practica1/screens/counter_screen.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:practica1/screens/main_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super (key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: MainScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/logo_p1.png",
      text: "Práctica 1: Shared Preferences",
      textType: TextType.ScaleAnimatedText,
      
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Color.fromARGB(255, 31, 79, 118),
    );
  }
}