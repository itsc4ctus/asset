import 'dart:async';
import 'package:asset/Presentation/auth_screen/auth_screen.dart';
import 'package:asset/Presentation/home_screen/home_screen.dart';
import 'package:asset/Presentation/splash_screen/loadcomponents.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   authCheck();
  }
Future<void> authCheck()async{
    Future.delayed(Duration(seconds: 3),(){
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAll(() => const HomeScreen()); // Navigate to Home if authenticated
      } else {
        Get.offAll(() => const AuthScreen()); // Navigate to Auth Screen if not authenticated
      }
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/applogo/large/large-black.png", width: 150), // App Logo
      ),
    );
  }
}