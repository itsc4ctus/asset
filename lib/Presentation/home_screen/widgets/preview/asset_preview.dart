import 'package:asset/Domain/buttons/largebutton.dart';
import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/widgets/asset_tile/asset_tile_preview.dart';
import 'package:asset/Models/asset_model/asset_model.dart';
import 'package:asset/Services/firebase_services/user_services/user_asset_services.dart';
import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';

class AssetPreview extends StatelessWidget {
  final AssetModel asset;
  AssetPreview({required this.asset, super.key});

  @override
  Widget build(BuildContext context) {
    final AssetController _assetController = Get.find<AssetController>(); // Get the existing instance

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AssetTilePreview(asset: asset),
        const SizedBox(height: 5),
        asset.status == "FREE"
            ? LargeButton(
          text: "ADD",
          onTap: () async {
            await UserAssetServices().addToAssetsFree(asset); // Add to assetsFREE
            await _assetController.fetchAssetsFree(); // Refresh the list
          },
        )
            : LargeButton(
          text: "BUY",
          onTap: () async {
            await UserAssetServices().addToAssetsPurchased(asset); // Add to assetsPURCHASED
            await _assetController.fetchAssetsPurchased(); // Refresh the list
          },
          color: AppColors.greenColor,
        ),
      ],
    );
  }
}