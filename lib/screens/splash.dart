import 'dart:async';

import 'package:esm/screens/home/home.dart';
import 'package:esm/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:esm/theme/theme.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    Timer(const Duration(seconds: 3), () {
      //Navigator.pushNamed(context, '/onboarding');
      if(FirebaseAuth.instance.currentUser ==null){
         Get.to(()=>const OnboardingScreen() );
      }
      else{
        Get.to(()=>const HomeScreen() );
      }
            

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          shrinkWrap: true,
          children: [
            Image.asset(
              "assets/splash/poolar-logo.png",
              height: size.height * 0.125,
            ),
            const Text(
              "",
              style: semibold28White,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
