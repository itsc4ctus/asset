import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/size.dart';
import 'package:asset/Domain/constants/textstyles.dart';
import 'package:asset/Presentation/auth_screen/widgets/button/auth_button.dart';
import 'package:asset/Presentation/home_screen/home_screen.dart';
import 'package:asset/Presentation/splash_screen/loadcomponents.dart';
import 'package:asset/Services/auth_services/google_auth.dart';
import 'package:asset/Services/firebase_services/user_services/user_services.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {


  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/applogo/large/large-black.png",
                height: AppConstants.screenWidth(context) * 0.4,
              ),
              const SizedBox(height: 5), // Spacing
              Text(
                "ANCHOR ASSET ASAP!",
                style: KTextStyles.regularExtraSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppConstants.screenHeight(context) * 0.04), // Responsive gap
              SocialLoginButton(
                text: "Sign in with Google",
                assetIcon: "assets/images/authlogo/google.png",
                onPressed: () async {
                  UserCredential? userCredential = await signInWithGoogle();
                  if (userCredential != null) {
                    final User user = userCredential.user!;
                    final UserService _userService = UserService();
                    await _userService.createOrUpdateUserDocument(user);
                    // final AssetController assetController = Get.put(AssetController());
                    // await Load().load();
                    // Navigate to HomeScreen
                    Get.offAll(() => const HomeScreen());
                    print("Google Sign-In Successful: ${user.displayName}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}