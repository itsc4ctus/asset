import 'package:asset/Domain/appbar/appbar.dart';
import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/constants.dart';
import 'package:asset/Domain/constants/icons.dart';
import 'package:asset/Domain/constants/textstyles.dart';
import 'package:asset/Presentation/bag_screen/widgets/Tabs/free_tab.dart';
import 'package:asset/Presentation/bag_screen/widgets/Tabs/paid_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: CustomAppbar(
          title: "Bag",
          titleIcon: AppIcons.smallIcon(CupertinoIcons.bag),
          actions: [],
          bottom: TabBar(
            tabs: const [
              Tab(text: "Free Assets"),
              Tab(text: "Paid Assets"),
            ],
            indicator: BoxDecoration(
              borderRadius: kConstants.borderRadiusSmall,
              color: AppColors.primaryColor, // Background color for the selected tab
            ),
            indicatorSize: TabBarIndicatorSize.tab, // Make the indicator span the full width of the tab
            labelColor: AppColors.secondaryColor, // Text color for the selected tab
            unselectedLabelColor: AppColors.disabledIconColor, // Text color for unselected tabs
            labelStyle: KTextStyles.regularExtraSmallTextStyle,
            unselectedLabelStyle: KTextStyles.hintTextStyle,
            labelPadding: EdgeInsets.zero, // Remove default padding for labels
            padding: EdgeInsets.zero, // Remove horizontal padding
            indicatorPadding: EdgeInsets.zero, // Remove padding around the indicator
          ),
        ),
        body: TabBarView(
          children: [
            FreeAssetsTab(), // Content for Free Assets tab
            PaidAssetsTab(), // Content for Paid Assets tab
          ],
        ),
      ),
    );
  }
}
