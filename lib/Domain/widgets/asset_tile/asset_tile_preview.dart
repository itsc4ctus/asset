import 'package:asset/Domain/constants/textstyles.dart';
import 'package:asset/Domain/widgets/asset_tile/widgets/preview_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/constants.dart';
import 'package:asset/Models/asset_model/asset_model.dart';


class AssetTilePreview extends StatelessWidget {
  final AssetModel asset;
  const AssetTilePreview({required this.asset, super.key});

  // Helper function to convert MB to GB if size is above 1024 MB
  String _formatSize(double sizeInMB) {
    if (sizeInMB >= 1024) {
      double sizeInGB = sizeInMB / 1024;
      return '${sizeInGB.toStringAsFixed(2)} GB';
    } else {
      return '${sizeInMB.toStringAsFixed(2)} MB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kConstants.borderRadiusSmall,
      color: AppColors.secondaryColor,
      child: InkWell(
        onTap: () {
          // Add functionality for when the tile is tapped
          print('Tile tapped: ${asset.name}');
        },
        onLongPress: () {
          // Show the preview bottom sheet on long press
          AssetPreviewBottomSheet.show(context, asset);
        },
        splashColor: Colors.blue.withOpacity(0.4),
        borderRadius: kConstants.borderRadiusSmall,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: kConstants.borderRadiusSmall,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Leftmost: Platform Logo (Fixed Width)
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Middle: Asset Details (Name, Platform, Author)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Asset Name
                      Text(
                        asset.name,
                        style: KTextStyles.boldSmallTextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Platform
                      Text(
                        'Platform: ${asset.platform}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Author Name
                      Text(
                        'Author: ${asset.author}',
                        style: KTextStyles.hintXSmallTextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Rightmost: Asset Price or FREE
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display Price or FREE
                    Text(
                      asset.status == "FREE" ? 'FREE' : '\₹${asset.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: asset.status == "FREE" ? Colors.green : AppColors.primaryColor,
                      ),
                    ),
                    // File Size
                    Text(
                      _formatSize(asset.size),
                      style: KTextStyles.hintXSmallTextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}