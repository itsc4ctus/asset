import 'package:flutter/material.dart';

class AppIcons {
  // Icon Sizes
  static const double large = 48.0;
  static const double medium = 32.0;
  static const double small = 24.0;
  static const double extraSmall = 16.0;

  // Method to get icons with predefined sizes
  static Icon largeIcon(IconData iconData, {Color? color}) {
    return Icon(iconData, size: large, color: color);
  }

  static Icon mediumIcon(IconData iconData, {Color? color}) {
    return Icon(iconData, size: medium, color: color);
  }

  static Icon smallIcon(IconData iconData, {Color? color}) {
    return Icon(iconData, size: small, color: color);
  }

  static Icon extraSmallIcon(IconData iconData, {Color? color}) {
    return Icon(iconData, size: extraSmall, color: color);
  }
}
