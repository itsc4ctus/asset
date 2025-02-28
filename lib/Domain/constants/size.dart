import 'package:flutter/material.dart';

class AppConstants {
  // Screen dimensions
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // Responsive padding
  static double paddingSmall(BuildContext context) => screenWidth(context) * 0.03;
  static double paddingMedium(BuildContext context) => screenWidth(context) * 0.05;
  static double paddingLarge(BuildContext context) => screenWidth(context) * 0.1;

  // Responsive font sizes
  static double fontSizeSmall(BuildContext context) => screenWidth(context) * 0.03;
  static double fontSizeMedium(BuildContext context) => screenWidth(context) * 0.04;
  static double fontSizeLarge(BuildContext context) => screenWidth(context) * 0.06;
}