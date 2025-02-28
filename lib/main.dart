import 'package:asset/Presentation/auth_screen/auth_screen.dart';
import 'package:asset/Presentation/home_screen/home_screen.dart';
import 'package:asset/Presentation/splash_screen/splash_screen.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      home: SplashScreen(),
    );
  }
}
