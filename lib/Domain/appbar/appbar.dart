import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/textstyles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? titleIcon;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom; // Add bottom property

  CustomAppbar({
    required this.title,
    this.titleIcon, // Optional parameter (default is null)
    this.actions,
    this.bottom, // Add bottom property
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min, // Prevent unnecessary space
        children: [
          Text(title, style: KTextStyles.appbarTextStyle),
          if (titleIcon != null) ...[SizedBox(width: 5), titleIcon!], // Show icon only if it's not null
        ],
      ),
      backgroundColor: AppColors.appbarColor, // Customize the background color
      elevation: 0, // Remove shadow
      actions: actions,
      bottom: bottom, // Add bottom property
    );
  }

  @override
  Size get preferredSize {
    // Adjust height if bottom widget is present
    if (bottom != null) {
      return Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height);
    }
    return const Size.fromHeight(kToolbarHeight); // Default app bar height
  }
}