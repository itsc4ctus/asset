import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/constants.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final IconData? icon;

  const LargeButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.primaryColor, // Set background color here
      borderRadius: kConstants.borderRadiusSmall,
      child: InkWell(
        onTap: onTap,
        borderRadius: kConstants.borderRadiusSmall,
        splashColor: AppColors.secondaryColor.withOpacity(0.2), // Splash effect color
        highlightColor: AppColors.secondaryColor.withOpacity(0.1), // Highlight effect color
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: kConstants.borderRadiusSmall,
          ),
          padding: EdgeInsets.symmetric(horizontal: 24), // Add horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: AppColors.secondaryColor, size: 24),
                SizedBox(width: 12), // Increase spacing between icon and text
              ],
              Text(
                text,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 23, // Slightly smaller font size
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}