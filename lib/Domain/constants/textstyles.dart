import 'package:asset/Domain/constants/colors.dart';
import 'package:flutter/material.dart';

class KTextStyles {
  // Font Sizes
  static const double large = 24;
  static const double medium = 22;
  static const double small = 18;
  static const double extraSmall = 16;
  static const double extraXSmall = 12;
  static const double caption = 14;

  // AppBar Text Style
  static const appbarTextStyle = TextStyle(
    fontSize: large,
    color: AppColors.appbarTextColor,
    fontWeight: FontWeight.w400,
  );

  // Bold Text Styles
  static const boldLargeTextStyle = TextStyle(
    fontSize: large,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w700,
  );

  static const boldMediumTextStyle = TextStyle(
    fontSize: medium,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w600,
  );

  static const boldSmallTextStyle = TextStyle(
    fontSize: small,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w500,
  );

  // Regular Text Styles
  static const regularLargeTextStyle = TextStyle(
    fontSize: large,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const regularMediumTextStyle = TextStyle(
    fontSize: medium,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const regularSmallTextStyle = TextStyle(
    fontSize: small,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const regularExtraSmallTextStyle = TextStyle(
    fontSize: extraSmall,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  // Caption Text Style
  static const captionTextStyle = TextStyle(
    fontSize: caption,
    color: AppColors.secondaryTextColor,
    fontWeight: FontWeight.w300,
  );

  // Button Text Style
  static const buttonTextStyle = TextStyle(
    fontSize: small,
    color: AppColors.buttonTextColor,
    fontWeight: FontWeight.w600,
  );

  // Hint Text Style
  static const hintTextStyle = TextStyle(
    fontSize: extraSmall,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w400,
  );

  static const hintMediumTextStyle = TextStyle(
    fontSize: medium,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w400,
  );

  static const hintXSmallTextStyle = TextStyle(
    fontSize: extraXSmall,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w400,
  );


}
