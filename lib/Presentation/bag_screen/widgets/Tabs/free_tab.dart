import 'package:asset/Domain/constants/size.dart';
import 'package:asset/Domain/widgets/asset_tile/asset_tile.dart';
import 'package:asset/Domain/widgets/asset_tile/asset_tile_preview.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreeAssetsTab extends StatelessWidget {
  FreeAssetsTab({super.key});
  final AssetController assetController = Get.find<AssetController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.all(AppConstants.paddingSmall(context)),
        child: ListView.separated(
          itemCount: assetController.assetsFree.length,
          itemBuilder: (context, index) {
            return AssetTile(asset: assetController.assetsFree[index]);
          },
          separatorBuilder: (context, index) => SizedBox(height: 10), // Add spacing
        ),
      );
    });
  }
}
