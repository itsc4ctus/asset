import 'package:asset/Domain/appbar/appbar.dart';
import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/constants.dart';
import 'package:asset/Domain/constants/size.dart';
import 'package:asset/Domain/drawer/drawer.dart';
import 'package:asset/Presentation/home_screen/widgets/appbar_widgets.dart';
import 'package:asset/Domain/widgets/hotfeild/hotfeild.dart';
import 'package:asset/Presentation/home_screen/widgets/preview/asset_preview.dart';
import 'package:asset/Domain/buttons/largebutton.dart';
import 'package:asset/Presentation/splash_screen/loadcomponents.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  void initState() {
  final AssetController assetController = Get.put(AssetController());
  Load().load();
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final AssetController assetController = Get.find<AssetController>();
    TextEditingController hotFeildController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: "Asset", actions: HomeScreenAppbar.actions),
      drawer: kDrawer(),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.paddingSmall(context)),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HotField(controller: hotFeildController),
                  SizedBox(height: kConstants.sizedBoxSmall),
                  LargeButton(
                    onTap: () {
                      assetController.fetchAsset(hotFeildController.text);
                    },
                    text: "CHECK",
                  ),
                ],
              ),
            ),

            // Observing Asset Changes
            Obx(() {
              if (assetController.isLoading.value) {
                return CircularProgressIndicator(); // Show loading indicator
              } else if (assetController.asset.value != null) {
                return AssetPreview(asset: assetController.asset.value!);
              } else {
                return SizedBox(); // Show nothing if no asset is found
              }
            }),
          ],
        ),
      ),
    );
  }
}
