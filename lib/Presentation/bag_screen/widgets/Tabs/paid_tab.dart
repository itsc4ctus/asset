import 'package:asset/Domain/constants/size.dart' show AppConstants;
import 'package:asset/Domain/widgets/asset_tile/asset_tile.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class PaidAssetsTab extends StatelessWidget {
 PaidAssetsTab({super.key});

  final AssetController _assetController = Get.find<AssetController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.all(AppConstants.paddingSmall(context)),
        child: ListView.separated(
          itemCount: _assetController.assetsPurchased.length,
          itemBuilder: (context, index) {
            return AssetTile(asset: _assetController.assetsPurchased[index]);
          },
          separatorBuilder: (context, index) => SizedBox(height: 10), // Add spacing
        ),
      );
    });
  }
}