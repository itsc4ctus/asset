import 'package:asset/Domain/constants/colors.dart';
import 'package:flutter/material.dart';

class kAppbarButton extends StatelessWidget {

  void Function()? onPressed;
  IconData? icon;
   kAppbarButton({required this.onPressed,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon,color: AppColors.appbarIconColor,));
  }
}


