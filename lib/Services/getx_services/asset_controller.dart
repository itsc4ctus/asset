import 'package:asset/Models/asset_model/asset_model.dart';
import 'package:asset/Services/firebase_services/asset_services/asset_instagram_services.dart';
import 'package:asset/Services/firebase_services/asset_services/asset_services.dart';
import 'package:asset/Services/firebase_services/user_services/user_asset_services.dart';
import 'package:get/get.dart';

class AssetController extends GetxController {
  var asset = Rxn<AssetModel>(); // Reactive AssetModel (nullable)
  var isLoading = false.obs; // Loading state
  var assetsFree = <AssetModel>[].obs;
  var assetsPurchased = <AssetModel>[].obs;

  final UserAssetServices _userAssetServices = UserAssetServices();
  final AssetInstagramServices _instagramService = AssetInstagramServices();
  final AssetServices _assetService = AssetServices();


  Future<void> fetchAssetsFree() async {
    isLoading.value = true;
    try {
      final fetchedAssets = await _userAssetServices.fetchAssetsFree();
      assetsFree.assignAll(fetchedAssets); // Update the reactive list
    } catch (e) {
      print("Error fetching free assets: $e");
      // Optionally, show an error message to the user
    } finally {
      isLoading.value = false;
    }
  }

  // Method to fetch purchased assets
  Future<void> fetchAssetsPurchased() async {
    isLoading.value = true;
    try {
      final fetchedAssets = await _userAssetServices.fetchAssetsPurchased();
      assetsPurchased.assignAll(fetchedAssets); // Update the reactive list
    } catch (e) {
      print("Error fetching purchased assets: $e");
      // Optionally, show an error message to the user
    } finally {
      isLoading.value = false;
    }
  }

  // Method to determine which service to use based on input
  Future<void> fetchAsset(String input) async {
    isLoading.value = true;
    asset.value = null; // Clear previous asset

    try {
      if (input.contains("instagram.com/reel/") || input.contains("instagram.com/p/")) {
        // Instagram Reel or Post detected
        asset.value = await _instagramService.fetchAssetByInstagramLink(input);
      } else {
        // Regular Asset ID
        asset.value = await _assetService.fetchAsset(input);
      }
    } catch (e) {
      print("Error fetching asset: $e");
      // Optionally, show an error message to the user
    } finally {
      isLoading.value = false;
    }
  }
}
