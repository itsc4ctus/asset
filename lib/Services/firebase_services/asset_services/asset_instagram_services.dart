import 'package:asset/Models/asset_model/asset_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssetInstagramServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --------------------- CREATE ---------------------

  // Upload (add) a new asset by Instagram link
  Future<bool> uploadAssetByInstagramLink(AssetModel newAsset, String instagramLink) async {
    try {
      String uniqueId = _extractUniqueId(instagramLink); // Extract unique ID from the link
      await _firestore
          .collection('assetsinstagram') // Updated collection name
          .doc(uniqueId)
          .set(newAsset.toMap());
      return true; // Successfully uploaded
    } catch (e) {
      print('Error uploading asset by Instagram link: $e');
      return false; // Failed to upload
    }
  }

  // --------------------- READ ---------------------

  // Fetch an asset by Instagram link
  Future<AssetModel?> fetchAssetByInstagramLink(String instagramLink) async {
    try {
      String uniqueId = _extractUniqueId(instagramLink);
      print("Fetching asset with unique ID: $uniqueId"); // Debugging log

      // Ensure the uniqueId is valid
      if (uniqueId.contains('//')) {
        throw Exception('Invalid unique ID: $uniqueId');
      }

      DocumentSnapshot doc = await _firestore
          .collection('assetsinstagram')
          .doc(uniqueId)
          .get();

      if (doc.exists) {
        return AssetModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        print("No asset found for ID: $uniqueId");
        return null;
      }
    } catch (e) {
      print('Error fetching asset by Instagram link: $e');
      return null;
    }
  }


  // --------------------- UPDATE ---------------------

  // Update an asset by Instagram link
  Future<bool> updateAssetByInstagramLink(String instagramLink, AssetModel updatedAsset) async {
    try {
      String uniqueId = _extractUniqueId(instagramLink); // Extract unique ID from the link
      await _firestore
          .collection('assetsinstagram') // Updated collection name
          .doc(uniqueId)
          .update(updatedAsset.toMap());
      return true; // Successfully updated
    } catch (e) {
      print('Error updating asset by Instagram link: $e');
      return false; // Failed to update
    }
  }

  // --------------------- DELETE ---------------------

  // Delete an asset by Instagram link
  Future<bool> deleteAssetByInstagramLink(String instagramLink) async {
    try {
      String uniqueId = _extractUniqueId(instagramLink); // Extract unique ID from the link
      await _firestore
          .collection('assetsinstagram') // Updated collection name
          .doc(uniqueId)
          .delete();
      return true; // Successfully deleted
    } catch (e) {
      print('Error deleting asset by Instagram link: $e');
      return false; // Failed to delete
    }
  }

  // --------------------- HELPER METHODS ---------------------

  // Helper function to extract the core part of the Instagram link
  String _extractUniqueId(String instagramLink) {
    try {
      Uri uri = Uri.parse(instagramLink);
      List<String> segments = uri.pathSegments;

      if (segments.isNotEmpty && (segments[0] == 'reel' || segments[0] == 'p')) {
        if (segments.length > 1) {
          String uniqueId = segments[1];
          // Ensure the uniqueId does not contain "//"
          if (uniqueId.contains('//')) {
            throw Exception('Invalid unique ID: $uniqueId');
          }
          print("Extracted Unique ID: $uniqueId"); // Debugging log
          return uniqueId;
        }
      }
    } catch (e) {
      print("Error parsing link: $e");
    }
    throw Exception('Invalid Instagram link format');
  }

}