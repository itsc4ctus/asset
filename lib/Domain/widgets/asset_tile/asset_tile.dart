import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:asset/Domain/constants/textstyles.dart';
import 'package:asset/Domain/constants/colors.dart';
import 'package:asset/Domain/constants/constants.dart';
import 'package:asset/Models/asset_model/asset_model.dart';
import 'package:asset/Services/dio_services/dio_services.dart'; // Import DioServices

class AssetTile extends StatefulWidget {
  final AssetModel asset;
  const AssetTile({required this.asset, super.key});

  @override
  _AssetTileState createState() => _AssetTileState();
}

class _AssetTileState extends State<AssetTile> {
  final DioServices _dioServices = DioServices();
  double _downloadProgress = 0.0;
  bool _isDownloading = false;

  // Helper function to convert MB to GB if size is above 1024 MB
  String _formatSize(double sizeInMB) {
    if (sizeInMB >= 1024) {
      double sizeInGB = sizeInMB / 1024;
      return '${sizeInGB.toStringAsFixed(2)} GB';
    } else {
      return '${sizeInMB.toStringAsFixed(2)} MB';
    }
  }

  // Function to handle file download
  Future<void> _downloadAsset() async {
    if (kIsWeb) {
      WebDownload().downloadFile(widget.asset.downloadLink, "file.zip");
      return;
    }
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    String? filePath = await _dioServices.downloadFile(
      widget.asset.downloadLink, // URL of the asset
      "${widget.asset.name}.zip", // File name (assuming it's a ZIP)
      onProgress: (received, total) {
        if (total != -1) {
          setState(() {
            _downloadProgress = received / total;
          });
        }
      },
    );

    setState(() {
      _isDownloading = false;
    });

    if (filePath != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download complete: $filePath")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Download failed.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kConstants.borderRadiusSmall,
      color: AppColors.secondaryColor,
      child: InkWell(
        onTap: () {
          print('Tile tapped: ${widget.asset.name}');
        },
        splashColor: Colors.blue.withOpacity(0.2),
        borderRadius: kConstants.borderRadiusSmall,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: kConstants.borderRadiusSmall,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                // Asset Details Row
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Platform Logo
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(Icons.image, size: 30, color: Colors.blue),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Asset Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.asset.name,
                              style: KTextStyles.boldSmallTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Platform: ${widget.asset.platform}',
                              style: KTextStyles.hintXSmallTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Author: ${widget.asset.author}',
                              style: KTextStyles.hintXSmallTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Download Button or Percentage
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _isDownloading
                              ? Text(
                            '${(_downloadProgress * 100).toStringAsFixed(0)}%',
                            style: KTextStyles.boldMediumTextStyle,
                          )
                              : IconButton(
                            icon: const Icon(Icons.download,
                                color: AppColors.primaryColor, size: 24),
                            onPressed: _downloadAsset,
                          ),
                          Text(
                            _formatSize(widget.asset.size),
                            style: KTextStyles.hintXSmallTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Linear Progress Indicator
                if (_isDownloading)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: LinearProgressIndicator(
                      value: _downloadProgress,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      color: AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}