import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/constants.dart';
import 'package:flutter/material.dart';

class HotField extends StatelessWidget {
  final TextEditingController? controller;

  const HotField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "enter asset link here...",
        hintStyle: TextStyle(color: AppColors.supportingPrimaryColor),
        filled: true,
        fillColor: AppColors.secondaryColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0), // Increased height
        border: OutlineInputBorder(
          borderRadius: kConstants.hotFeildBorderRadius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kConstants.hotFeildBorderRadius,
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: kConstants.hotFeildBorderRadius,
          borderSide: const BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(fontSize: kConstants.fontSizeMedium),
    );
  }
}
