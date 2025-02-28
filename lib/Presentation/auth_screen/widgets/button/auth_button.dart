import 'package:asset/Domain/constants/textstyles.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String assetIcon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.assetIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
  
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.blue.withOpacity(0.4), // Metallic splash effect
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(assetIcon, height: 24), // Icon Image
              const SizedBox(width: 10),
              Text(
                text,
                style: KTextStyles.boldSmallTextStyle.copyWith(
                  color: Colors.black, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
