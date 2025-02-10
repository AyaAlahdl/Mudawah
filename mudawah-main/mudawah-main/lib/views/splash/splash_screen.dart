import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/others/routes/routes.dart';
import 'package:mudawah/views/Home/HomePage.dart';
import 'package:mudawah/views/loginSys/login_screen/login_screen.dart';
import 'package:mudawah/views/splash/temp.dart';

import '../../components/bottom_navigations.dart';
import '../../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          Image.asset(
            'assets/splashscreen/splash.gif',
          ),
        ],
      ),
      splashIconSize: 300,
      duration: 3000,
      nextScreen: Temp(),
    );
  }
}
