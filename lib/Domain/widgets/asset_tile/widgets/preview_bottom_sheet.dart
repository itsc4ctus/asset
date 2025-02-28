import 'package:asset/Domain/buttons/smallbutton.dart';
import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:asset/Models/asset_model/asset_model.dart';

class AssetPreviewBottomSheet extends StatelessWidget {
  final AssetModel asset;

  const AssetPreviewBottomSheet({required this.asset, super.key});

  // Helper function to convert MB to GB if size is above 1024 MB
  String _formatSize(double sizeInMB) {
    if (sizeInMB >= 1024) {
      double sizeInGB = sizeInMB / 1024;
      return '${sizeInGB.toStringAsFixed(2)} GB';
    } else {
      return '${sizeInMB.toStringAsFixed(2)} MB';
    }
  }

  // Static method to show the bottom sheet
  static void show(BuildContext context, AssetModel asset) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.secondaryColor,
      builder: (context) {
        return AssetPreviewBottomSheet(asset: asset);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Asset Name
            Center(
              child: Text(
                asset.name,
                style: KTextStyles.boldMediumTextStyle
              ),
            ),
            const SizedBox(height: 16),
            // Platform
            _buildDetailRow('Platform', asset.platform),
            const SizedBox(height: 12),
            // Author
            _buildDetailRow('Author', asset.author),
            const SizedBox(height: 12),
            // File Size
            _buildDetailRow('Size', _formatSize(asset.size)),
            const SizedBox(height: 12),
            // Price or Status
            _buildDetailRow(
              'Price',
              asset.status == "FREE" ? 'FREE' : '₹${asset.price.toStringAsFixed(2)}',
              valueColor: asset.status == "FREE" ? Colors.green : Colors.blue,
            ),
            const SizedBox(height: 12),
            // File Category
            _buildDetailRow('Category', asset.fileCategory),
            const SizedBox(height: 12),
            // File Extension
            _buildDetailRow('File Type', asset.fileExtension),
            const SizedBox(height: 12),
            // Preview Button
            if (asset.status != "FREE")
              MediumButton(
                text: "PREVIEW",
                onTap: () {
                  // Add preview functionality here
                  print('Previewing ${asset.name}');
                },
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper method to build a detail row
  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        Text(
          '$label: ',
          style:KTextStyles.hintTextStyle ,
        ),
        Text(
          value,
          style:valueColor==null ? KTextStyles.boldSmallTextStyle:TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}